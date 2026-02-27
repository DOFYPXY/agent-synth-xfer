#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod3, 17)
MAKE_OPAQUE_UNIFORM(Mod3, 18)
MAKE_OPAQUE_UNIFORM(Mod3, 19)
MAKE_OPAQUE_UNIFORM(Mod3, 20)
MAKE_OPAQUE_UNIFORM(Mod3, 21)
MAKE_OPAQUE_UNIFORM(Mod3, 22)
MAKE_OPAQUE_UNIFORM(Mod3, 23)
MAKE_OPAQUE_UNIFORM(Mod3, 24)

void register_mod3_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<Mod3, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
