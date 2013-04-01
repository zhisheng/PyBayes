# Copyright (c) 2010 Matej Laitl <matej@laitl.cz>
# Distributed under the terms of the GNU General Public License v2 or any
# later version of the license, at your option.

"""Wrapper around numpy - python version"""

from numpy import *


def vector(size):
    return empty(size)

def matrix(rows, cols):
    return empty((rows, cols))

# NumPy doesn't differentiate between vectors and matrices
dot_vv = dot
dot_vm = dot
dot_mv = dot
dot_mm = dot

sum_v = sum

def reindex_mv(data, indices):
    data[:] = data[indices]
reindex_vv = reindex_mv
