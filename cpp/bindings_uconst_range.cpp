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
MAKE_OPAQUE_UNIFORM(UConstRange, 9)
MAKE_OPAQUE_UNIFORM(UConstRange, 10)
MAKE_OPAQUE_UNIFORM(UConstRange, 11)
MAKE_OPAQUE_UNIFORM(UConstRange, 12)
MAKE_OPAQUE_UNIFORM(UConstRange, 13)
MAKE_OPAQUE_UNIFORM(UConstRange, 14)
MAKE_OPAQUE_UNIFORM(UConstRange, 15)
MAKE_OPAQUE_UNIFORM(UConstRange, 16)

void register_uconst_range_bindings(py::module_ &m) {
  register_domain_widths<UConstRange, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                         13, 14, 15, 16>(m);
}
