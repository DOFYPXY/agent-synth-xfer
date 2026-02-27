#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod13, 25)
MAKE_OPAQUE_UNIFORM(Mod13, 26)
MAKE_OPAQUE_UNIFORM(Mod13, 27)
MAKE_OPAQUE_UNIFORM(Mod13, 28)
MAKE_OPAQUE_UNIFORM(Mod13, 29)
MAKE_OPAQUE_UNIFORM(Mod13, 30)
MAKE_OPAQUE_UNIFORM(Mod13, 31)
MAKE_OPAQUE_UNIFORM(Mod13, 32)

void register_mod13_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<Mod13, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
