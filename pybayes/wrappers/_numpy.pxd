# Copyright (c) 2010 Matej Laitl <matej@laitl.cz>
# Distributed under the terms of the GNU General Public License v2 or any
# later version of the license, at your option.

"""Definitions for wrapper around numpy - cython version"""

from ceygen.core cimport *
from ceygen.elemwise cimport *
from ceygen.reductions cimport *
from numpy cimport ndarray

from pybayes.filters cimport KalmanFilter
from pybayes.pdfs cimport CPdf


cdef double[:] vector(int size)
cdef int[:] index_vector(int size)
cdef CPdf[:] cpdf_vector(int size)
cdef double[:, :] matrix(int rows, int cols)

cdef double[:] zeros(int size)

ctypedef fused reindexable:
    double
    KalmanFilter

cdef bint reindex_vv(reindexable[:] data, int[:] indices) except False
cdef bint reindex_mv(reindexable[:, :] data, int[:] indices) except False
