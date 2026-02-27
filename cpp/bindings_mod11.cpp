#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod11, 4)
MAKE_OPAQUE_UNIFORM(Mod11, 8)
MAKE_OPAQUE_UNIFORM(Mod11, 16)
MAKE_OPAQUE_UNIFORM(Mod11, 32)
MAKE_OPAQUE_UNIFORM(Mod11, 64)

void register_mod11_bindings(py::module_ &m) {
  register_domain_widths<Mod11, 4, 8, 16, 32, 64>(m);
}
