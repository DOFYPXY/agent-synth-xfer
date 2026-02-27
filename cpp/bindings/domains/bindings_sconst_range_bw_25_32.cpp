#include "bindings_common.hpp"
#include "sconst_range.hpp"

MAKE_OPAQUE_UNIFORM(SConstRange, 25)
MAKE_OPAQUE_UNIFORM(SConstRange, 26)
MAKE_OPAQUE_UNIFORM(SConstRange, 27)
MAKE_OPAQUE_UNIFORM(SConstRange, 28)
MAKE_OPAQUE_UNIFORM(SConstRange, 29)
MAKE_OPAQUE_UNIFORM(SConstRange, 30)
MAKE_OPAQUE_UNIFORM(SConstRange, 31)
MAKE_OPAQUE_UNIFORM(SConstRange, 32)

void register_sconst_range_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<SConstRange, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
