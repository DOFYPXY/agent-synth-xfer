#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod5, 17)
MAKE_OPAQUE_UNIFORM(Mod5, 18)
MAKE_OPAQUE_UNIFORM(Mod5, 19)
MAKE_OPAQUE_UNIFORM(Mod5, 20)
MAKE_OPAQUE_UNIFORM(Mod5, 21)
MAKE_OPAQUE_UNIFORM(Mod5, 22)
MAKE_OPAQUE_UNIFORM(Mod5, 23)
MAKE_OPAQUE_UNIFORM(Mod5, 24)

void register_mod5_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<Mod5, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
