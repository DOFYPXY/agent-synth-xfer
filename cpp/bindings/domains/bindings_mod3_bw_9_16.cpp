#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod3, 9)
MAKE_OPAQUE_UNIFORM(Mod3, 10)
MAKE_OPAQUE_UNIFORM(Mod3, 11)
MAKE_OPAQUE_UNIFORM(Mod3, 12)
MAKE_OPAQUE_UNIFORM(Mod3, 13)
MAKE_OPAQUE_UNIFORM(Mod3, 14)
MAKE_OPAQUE_UNIFORM(Mod3, 15)
MAKE_OPAQUE_UNIFORM(Mod3, 16)

void register_mod3_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<Mod3, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
