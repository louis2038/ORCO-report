"""
Export cone data for Typst 3D visualization.

Computes CHSH generators, projects them onto (S, S', t),
and exports as JSON for Typst to read.
"""

from __future__ import annotations

import json
from collections import Counter
from itertools import product

import numpy as np


# ============================================================
# CHSH encoding
# ============================================================


def to_tensor(m) -> np.ndarray:
    arr = np.asarray(m, dtype=int)
    if arr.shape == (2, 2, 2, 2):
        return arr.copy()
    if arr.shape == (4, 4):
        return arr.reshape(2, 2, 2, 2)
    if arr.size == 16:
        return arr.reshape(2, 2, 2, 2)
    raise ValueError(f"Format non reconnu: {arr.shape}")


def E(m, x: int, y: int) -> int:
    t = to_tensor(m)
    return int(t[x, y, 0, 0] + t[x, y, 1, 1] - t[x, y, 0, 1] - t[x, y, 1, 0])


def S_func(m) -> int:
    return E(m, 0, 0) + E(m, 0, 1) + E(m, 1, 0) - E(m, 1, 1)


def Sp_func(m) -> int:
    return E(m, 0, 0) + E(m, 0, 1) - E(m, 1, 0) + E(m, 1, 1)


def get_t(m) -> int:
    sums = to_tensor(m).sum(axis=(2, 3))
    return int(sums[0, 0])


def projection(m) -> tuple[int, int, int]:
    return S_func(m), Sp_func(m), get_t(m)


# ============================================================
# Generators
# ============================================================


def deterministic_generator(a0, a1, b0, b1) -> np.ndarray:
    g = np.zeros((2, 2, 2, 2), dtype=int)
    a_map = {0: a0, 1: a1}
    b_map = {0: b0, 1: b1}
    for x, y in product((0, 1), repeat=2):
        g[x, y, a_map[x], b_map[y]] = 1
    return g


def pr_generator(alpha, beta, gamma) -> np.ndarray:
    g = np.zeros((2, 2, 2, 2), dtype=int)
    for x, y, a, b in product((0, 1), repeat=4):
        rhs = (x & y) ^ (alpha & x) ^ (beta & y) ^ gamma
        if (a ^ b) == rhs:
            g[x, y, a, b] = 1
    return g


LOCAL_GENS = [
    deterministic_generator(a0, a1, b0, b1)
    for a0, a1, b0, b1 in product((0, 1), repeat=4)
]

PR_GENS = [
    pr_generator(alpha, beta, gamma)
    for alpha, beta, gamma in product((0, 1), repeat=3)
]


# ============================================================
# Slices
# ============================================================


def ns_slice_t1():
    return [g.copy() for g in LOCAL_GENS]


def ns_slice_t2():
    pts = []
    # local + local
    for i in range(len(LOCAL_GENS)):
        for j in range(i, len(LOCAL_GENS)):
            pts.append(LOCAL_GENS[i] + LOCAL_GENS[j])
    # PR
    pts.extend([g.copy() for g in PR_GENS])
    return pts


def ns_slice_t3():
    pts = []
    # local + local + local
    for i in range(len(LOCAL_GENS)):
        for j in range(i, len(LOCAL_GENS)):
            for k in range(j, len(LOCAL_GENS)):
                pts.append(LOCAL_GENS[i] + LOCAL_GENS[j] + LOCAL_GENS[k])
    # PR + local
    for pr in PR_GENS:
        for loc in LOCAL_GENS:
            pts.append(pr + loc)
    return pts


def group_projections(points):
    """Group points by (S, S', t) and count multiplicities."""
    counts = Counter(tuple(projection(p)) for p in points)
    result = []
    for (s, sp, t), mult in sorted(counts.items()):
        result.append({"s": s, "sp": sp, "t": t, "mult": mult})
    return result


# ============================================================
# Export
# ============================================================


def main():
    data = {
        "local_rays": [],
        "pr_rays": [],
        "slices": {},
    }

    # Local generators (rays from origin)
    local_proj = Counter(projection(g) for g in LOCAL_GENS)
    for (s, sp, t), c in local_proj.items():
        data["local_rays"].append({"s": s, "sp": sp, "t": t, "mult": c})

    # PR generators (rays from origin)
    pr_proj = Counter(projection(g) for g in PR_GENS)
    for (s, sp, t), c in pr_proj.items():
        data["pr_rays"].append({"s": s, "sp": sp, "t": t, "mult": c})

    # Slices
    data["slices"]["t=1"] = group_projections(ns_slice_t1())
    data["slices"]["t=2"] = group_projections(ns_slice_t2())
    data["slices"]["t=3"] = group_projections(ns_slice_t3())

    out_path = "cone_data.json"
    with open(out_path, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Exported to {out_path}")
    print(f"  local_rays: {len(data['local_rays'])} entries")
    print(f"  pr_rays: {len(data['pr_rays'])} entries")
    for name, sl in data["slices"].items():
        print(f"  slice {name}: {len(sl)} distinct points")


if __name__ == "__main__":
    main()
