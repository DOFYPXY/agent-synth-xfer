#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod13, 4)
MAKE_OPAQUE_UNIFORM(Mod13, 8)
MAKE_OPAQUE_UNIFORM(Mod13, 16)
MAKE_OPAQUE_UNIFORM(Mod13, 32)
MAKE_OPAQUE_UNIFORM(Mod13, 64)

void register_mod13_bindings(py::module_ &m) {
  register_domain_widths<Mod13, 4, 8, 16, 32, 64>(m);
}
