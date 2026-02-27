#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod7, 1)
MAKE_OPAQUE_UNIFORM(Mod7, 2)
MAKE_OPAQUE_UNIFORM(Mod7, 3)
MAKE_OPAQUE_UNIFORM(Mod7, 4)
MAKE_OPAQUE_UNIFORM(Mod7, 5)
MAKE_OPAQUE_UNIFORM(Mod7, 6)
MAKE_OPAQUE_UNIFORM(Mod7, 7)
MAKE_OPAQUE_UNIFORM(Mod7, 8)

void register_mod7_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<Mod7, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
