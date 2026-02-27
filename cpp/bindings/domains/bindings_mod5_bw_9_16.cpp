#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod5, 9)
MAKE_OPAQUE_UNIFORM(Mod5, 10)
MAKE_OPAQUE_UNIFORM(Mod5, 11)
MAKE_OPAQUE_UNIFORM(Mod5, 12)
MAKE_OPAQUE_UNIFORM(Mod5, 13)
MAKE_OPAQUE_UNIFORM(Mod5, 14)
MAKE_OPAQUE_UNIFORM(Mod5, 15)
MAKE_OPAQUE_UNIFORM(Mod5, 16)

void register_mod5_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<Mod5, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
