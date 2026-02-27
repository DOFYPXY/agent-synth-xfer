#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod7, 9)
MAKE_OPAQUE_UNIFORM(Mod7, 10)
MAKE_OPAQUE_UNIFORM(Mod7, 11)
MAKE_OPAQUE_UNIFORM(Mod7, 12)
MAKE_OPAQUE_UNIFORM(Mod7, 13)
MAKE_OPAQUE_UNIFORM(Mod7, 14)
MAKE_OPAQUE_UNIFORM(Mod7, 15)
MAKE_OPAQUE_UNIFORM(Mod7, 16)

void register_mod7_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<Mod7, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
