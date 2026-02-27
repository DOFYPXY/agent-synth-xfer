#include "bindings_common.hpp"
#include "uconst_range.hpp"

MAKE_OPAQUE_UNIFORM(UConstRange, 25)
MAKE_OPAQUE_UNIFORM(UConstRange, 26)
MAKE_OPAQUE_UNIFORM(UConstRange, 27)
MAKE_OPAQUE_UNIFORM(UConstRange, 28)
MAKE_OPAQUE_UNIFORM(UConstRange, 29)
MAKE_OPAQUE_UNIFORM(UConstRange, 30)
MAKE_OPAQUE_UNIFORM(UConstRange, 31)
MAKE_OPAQUE_UNIFORM(UConstRange, 32)

void register_uconst_range_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<UConstRange, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
