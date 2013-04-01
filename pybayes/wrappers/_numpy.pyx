# Copyright (c) 2010 Matej Laitl <matej@laitl.cz>
# Distributed under the terms of the GNU General Public License v2 or any
# later version of the license, at your option.

"""Wrapper around numpy - cython version"""

# import numpy types and functions, override some as needed.
# this file is special - it is used only in cython build, this can contain code
# not callable from python etc.

cimport ceygen.dtype as d
# cython workaround: cannot import *
from numpy import any, arange, array, asarray, concatenate, cumsum, diag, exp, eye, ones
from numpy import prod


cdef double[:] vector(int size):
    return d.vector(size, <double *> 0)

cdef int[:] index_vector(int size):
    return d.vector(size, <int *> 0)

cdef CPdf[:] cpdf_vector(int size):
    from numpy import empty
    return empty(size, dtype=CPdf)  # TODO: is there a better solution?

cdef double[:, :] matrix(int rows, int cols):
    return d.matrix(rows, cols, <double *> 0)

cdef double[:] zeros(int size):
    ret = vector(size)
    ret[:] = 0
    return ret

cdef bint reindex_vv(reindexable[:] data, int[:] indices) except False:
    assert data.shape[0] == indices.shape[0]
    cdef int newi
    datacopy = data.copy()
    for i in range(data.shape[0]):
        newi = indices[i]
        assert newi >= 0 and newi < data.shape[0]
        data[i] = datacopy[newi]


cdef bint reindex_mv(reindexable[:, :] data, int[:] indices) except False:
    assert data.shape[0] == indices.shape[0]
    cdef int newi
    datacopy = data.copy()
    for i in range(data.shape[0]):
        newi = indices[i]
        assert newi >= 0 and newi < data.shape[0]
        data[i, :] = datacopy[newi, :]
