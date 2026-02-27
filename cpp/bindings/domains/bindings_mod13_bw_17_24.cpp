#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod13, 17)
MAKE_OPAQUE_UNIFORM(Mod13, 18)
MAKE_OPAQUE_UNIFORM(Mod13, 19)
MAKE_OPAQUE_UNIFORM(Mod13, 20)
MAKE_OPAQUE_UNIFORM(Mod13, 21)
MAKE_OPAQUE_UNIFORM(Mod13, 22)
MAKE_OPAQUE_UNIFORM(Mod13, 23)
MAKE_OPAQUE_UNIFORM(Mod13, 24)

void register_mod13_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<Mod13, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
