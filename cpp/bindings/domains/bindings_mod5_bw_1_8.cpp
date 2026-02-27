#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod5, 1)
MAKE_OPAQUE_UNIFORM(Mod5, 2)
MAKE_OPAQUE_UNIFORM(Mod5, 3)
MAKE_OPAQUE_UNIFORM(Mod5, 4)
MAKE_OPAQUE_UNIFORM(Mod5, 5)
MAKE_OPAQUE_UNIFORM(Mod5, 6)
MAKE_OPAQUE_UNIFORM(Mod5, 7)
MAKE_OPAQUE_UNIFORM(Mod5, 8)

void register_mod5_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<Mod5, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
