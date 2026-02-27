#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod3, 25)
MAKE_OPAQUE_UNIFORM(Mod3, 26)
MAKE_OPAQUE_UNIFORM(Mod3, 27)
MAKE_OPAQUE_UNIFORM(Mod3, 28)
MAKE_OPAQUE_UNIFORM(Mod3, 29)
MAKE_OPAQUE_UNIFORM(Mod3, 30)
MAKE_OPAQUE_UNIFORM(Mod3, 31)
MAKE_OPAQUE_UNIFORM(Mod3, 32)

void register_mod3_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<Mod3, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
