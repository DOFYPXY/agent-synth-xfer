#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod3, 4)
MAKE_OPAQUE_UNIFORM(Mod3, 8)
MAKE_OPAQUE_UNIFORM(Mod3, 16)
MAKE_OPAQUE_UNIFORM(Mod3, 32)
MAKE_OPAQUE_UNIFORM(Mod3, 64)

void register_mod3_bindings(py::module_ &m) {
  register_domain_widths<Mod3, 4, 8, 16, 32, 64>(m);
}
