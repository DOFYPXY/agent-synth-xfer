#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod7, 4)
MAKE_OPAQUE_UNIFORM(Mod7, 8)
MAKE_OPAQUE_UNIFORM(Mod7, 16)
MAKE_OPAQUE_UNIFORM(Mod7, 32)
MAKE_OPAQUE_UNIFORM(Mod7, 64)

void register_mod7_bindings(py::module_ &m) {
  register_domain_widths<Mod7, 4, 8, 16, 32, 64>(m);
}
