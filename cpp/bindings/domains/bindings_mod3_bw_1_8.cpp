#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod3, 1)
MAKE_OPAQUE_UNIFORM(Mod3, 2)
MAKE_OPAQUE_UNIFORM(Mod3, 3)
MAKE_OPAQUE_UNIFORM(Mod3, 4)
MAKE_OPAQUE_UNIFORM(Mod3, 5)
MAKE_OPAQUE_UNIFORM(Mod3, 6)
MAKE_OPAQUE_UNIFORM(Mod3, 7)
MAKE_OPAQUE_UNIFORM(Mod3, 8)

void register_mod3_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<Mod3, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
