#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod13, 1)
MAKE_OPAQUE_UNIFORM(Mod13, 2)
MAKE_OPAQUE_UNIFORM(Mod13, 3)
MAKE_OPAQUE_UNIFORM(Mod13, 4)
MAKE_OPAQUE_UNIFORM(Mod13, 5)
MAKE_OPAQUE_UNIFORM(Mod13, 6)
MAKE_OPAQUE_UNIFORM(Mod13, 7)
MAKE_OPAQUE_UNIFORM(Mod13, 8)

void register_mod13_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<Mod13, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
