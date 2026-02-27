#include "bindings_common.hpp"
#include "sconst_range.hpp"

MAKE_OPAQUE_UNIFORM(SConstRange, 17)
MAKE_OPAQUE_UNIFORM(SConstRange, 18)
MAKE_OPAQUE_UNIFORM(SConstRange, 19)
MAKE_OPAQUE_UNIFORM(SConstRange, 20)
MAKE_OPAQUE_UNIFORM(SConstRange, 21)
MAKE_OPAQUE_UNIFORM(SConstRange, 22)
MAKE_OPAQUE_UNIFORM(SConstRange, 23)
MAKE_OPAQUE_UNIFORM(SConstRange, 24)

void register_sconst_range_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<SConstRange, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
