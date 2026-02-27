#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod7, 25)
MAKE_OPAQUE_UNIFORM(Mod7, 26)
MAKE_OPAQUE_UNIFORM(Mod7, 27)
MAKE_OPAQUE_UNIFORM(Mod7, 28)
MAKE_OPAQUE_UNIFORM(Mod7, 29)
MAKE_OPAQUE_UNIFORM(Mod7, 30)
MAKE_OPAQUE_UNIFORM(Mod7, 31)
MAKE_OPAQUE_UNIFORM(Mod7, 32)

void register_mod7_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<Mod7, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
