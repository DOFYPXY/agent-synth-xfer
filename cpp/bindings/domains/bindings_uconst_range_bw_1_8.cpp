#include "bindings_common.hpp"
#include "uconst_range.hpp"

MAKE_OPAQUE_UNIFORM(UConstRange, 1)
MAKE_OPAQUE_UNIFORM(UConstRange, 2)
MAKE_OPAQUE_UNIFORM(UConstRange, 3)
MAKE_OPAQUE_UNIFORM(UConstRange, 4)
MAKE_OPAQUE_UNIFORM(UConstRange, 5)
MAKE_OPAQUE_UNIFORM(UConstRange, 6)
MAKE_OPAQUE_UNIFORM(UConstRange, 7)
MAKE_OPAQUE_UNIFORM(UConstRange, 8)

void register_uconst_range_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<UConstRange, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
