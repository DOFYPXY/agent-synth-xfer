#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod5, 4)
MAKE_OPAQUE_UNIFORM(Mod5, 8)
MAKE_OPAQUE_UNIFORM(Mod5, 16)
MAKE_OPAQUE_UNIFORM(Mod5, 32)
MAKE_OPAQUE_UNIFORM(Mod5, 64)

void register_mod5_bindings(py::module_ &m) {
  register_domain_widths<Mod5, 4, 8, 16, 32, 64>(m);
}
