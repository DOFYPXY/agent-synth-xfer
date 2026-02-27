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
MAKE_OPAQUE_UNIFORM(SConstRange, 9)
MAKE_OPAQUE_UNIFORM(SConstRange, 10)
MAKE_OPAQUE_UNIFORM(SConstRange, 11)
MAKE_OPAQUE_UNIFORM(SConstRange, 12)
MAKE_OPAQUE_UNIFORM(SConstRange, 13)
MAKE_OPAQUE_UNIFORM(SConstRange, 14)
MAKE_OPAQUE_UNIFORM(SConstRange, 15)
MAKE_OPAQUE_UNIFORM(SConstRange, 16)

void register_sconst_range_bindings(py::module_ &m) {
  register_domain_widths<SConstRange, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                         13, 14, 15, 16>(m);
}
