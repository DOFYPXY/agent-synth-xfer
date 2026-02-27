#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod11, 1)
MAKE_OPAQUE_UNIFORM(Mod11, 2)
MAKE_OPAQUE_UNIFORM(Mod11, 3)
MAKE_OPAQUE_UNIFORM(Mod11, 4)
MAKE_OPAQUE_UNIFORM(Mod11, 5)
MAKE_OPAQUE_UNIFORM(Mod11, 6)
MAKE_OPAQUE_UNIFORM(Mod11, 7)
MAKE_OPAQUE_UNIFORM(Mod11, 8)

void register_mod11_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<Mod11, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
