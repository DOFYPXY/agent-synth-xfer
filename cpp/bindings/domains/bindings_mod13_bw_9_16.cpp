#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod13, 9)
MAKE_OPAQUE_UNIFORM(Mod13, 10)
MAKE_OPAQUE_UNIFORM(Mod13, 11)
MAKE_OPAQUE_UNIFORM(Mod13, 12)
MAKE_OPAQUE_UNIFORM(Mod13, 13)
MAKE_OPAQUE_UNIFORM(Mod13, 14)
MAKE_OPAQUE_UNIFORM(Mod13, 15)
MAKE_OPAQUE_UNIFORM(Mod13, 16)

void register_mod13_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<Mod13, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
