#include "bindings_common.hpp"

void register_mod11_bindings_bw_1_8(py::module_ &m);
void register_mod11_bindings_bw_9_16(py::module_ &m);
void register_mod11_bindings_bw_17_24(py::module_ &m);
void register_mod11_bindings_bw_25_32(py::module_ &m);

void register_mod11_bindings(py::module_ &m) {
  register_mod11_bindings_bw_1_8(m);
  register_mod11_bindings_bw_9_16(m);
  register_mod11_bindings_bw_17_24(m);
  register_mod11_bindings_bw_25_32(m);
}
