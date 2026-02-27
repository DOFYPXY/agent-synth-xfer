#include "bindings_common.hpp"
#include "uconst_range.hpp"

MAKE_OPAQUE_UNIFORM(UConstRange, 17)
MAKE_OPAQUE_UNIFORM(UConstRange, 18)
MAKE_OPAQUE_UNIFORM(UConstRange, 19)
MAKE_OPAQUE_UNIFORM(UConstRange, 20)
MAKE_OPAQUE_UNIFORM(UConstRange, 21)
MAKE_OPAQUE_UNIFORM(UConstRange, 22)
MAKE_OPAQUE_UNIFORM(UConstRange, 23)
MAKE_OPAQUE_UNIFORM(UConstRange, 24)

void register_uconst_range_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<UConstRange, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
