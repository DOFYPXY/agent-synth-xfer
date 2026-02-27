#include "bindings_common.hpp"

void register_knownbits_bindings_bw_1_8(py::module_ &m);
void register_knownbits_bindings_bw_9_16(py::module_ &m);
void register_knownbits_bindings_bw_17_24(py::module_ &m);
void register_knownbits_bindings_bw_25_32(py::module_ &m);

void register_knownbits_bindings(py::module_ &m) {
  register_knownbits_bindings_bw_1_8(m);
  register_knownbits_bindings_bw_9_16(m);
  register_knownbits_bindings_bw_17_24(m);
  register_knownbits_bindings_bw_25_32(m);
}
