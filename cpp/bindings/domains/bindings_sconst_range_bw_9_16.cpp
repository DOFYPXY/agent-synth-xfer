#include "bindings_common.hpp"
#include "sconst_range.hpp"

MAKE_OPAQUE_UNIFORM(SConstRange, 9)
MAKE_OPAQUE_UNIFORM(SConstRange, 10)
MAKE_OPAQUE_UNIFORM(SConstRange, 11)
MAKE_OPAQUE_UNIFORM(SConstRange, 12)
MAKE_OPAQUE_UNIFORM(SConstRange, 13)
MAKE_OPAQUE_UNIFORM(SConstRange, 14)
MAKE_OPAQUE_UNIFORM(SConstRange, 15)
MAKE_OPAQUE_UNIFORM(SConstRange, 16)

void register_sconst_range_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<SConstRange, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
