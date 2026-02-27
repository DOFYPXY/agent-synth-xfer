#include "bindings_common.hpp"
#include "sconst_range.hpp"

MAKE_OPAQUE_UNIFORM(SConstRange, 1)
MAKE_OPAQUE_UNIFORM(SConstRange, 2)
MAKE_OPAQUE_UNIFORM(SConstRange, 3)
MAKE_OPAQUE_UNIFORM(SConstRange, 4)
MAKE_OPAQUE_UNIFORM(SConstRange, 5)
MAKE_OPAQUE_UNIFORM(SConstRange, 6)
MAKE_OPAQUE_UNIFORM(SConstRange, 7)
MAKE_OPAQUE_UNIFORM(SConstRange, 8)

void register_sconst_range_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<SConstRange, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
