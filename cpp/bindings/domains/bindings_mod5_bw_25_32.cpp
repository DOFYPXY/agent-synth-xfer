#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod5, 25)
MAKE_OPAQUE_UNIFORM(Mod5, 26)
MAKE_OPAQUE_UNIFORM(Mod5, 27)
MAKE_OPAQUE_UNIFORM(Mod5, 28)
MAKE_OPAQUE_UNIFORM(Mod5, 29)
MAKE_OPAQUE_UNIFORM(Mod5, 30)
MAKE_OPAQUE_UNIFORM(Mod5, 31)
MAKE_OPAQUE_UNIFORM(Mod5, 32)

void register_mod5_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<Mod5, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
