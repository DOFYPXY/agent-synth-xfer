#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod7, 17)
MAKE_OPAQUE_UNIFORM(Mod7, 18)
MAKE_OPAQUE_UNIFORM(Mod7, 19)
MAKE_OPAQUE_UNIFORM(Mod7, 20)
MAKE_OPAQUE_UNIFORM(Mod7, 21)
MAKE_OPAQUE_UNIFORM(Mod7, 22)
MAKE_OPAQUE_UNIFORM(Mod7, 23)
MAKE_OPAQUE_UNIFORM(Mod7, 24)

void register_mod7_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<Mod7, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
