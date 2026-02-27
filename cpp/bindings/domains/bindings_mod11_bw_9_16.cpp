#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod11, 9)
MAKE_OPAQUE_UNIFORM(Mod11, 10)
MAKE_OPAQUE_UNIFORM(Mod11, 11)
MAKE_OPAQUE_UNIFORM(Mod11, 12)
MAKE_OPAQUE_UNIFORM(Mod11, 13)
MAKE_OPAQUE_UNIFORM(Mod11, 14)
MAKE_OPAQUE_UNIFORM(Mod11, 15)
MAKE_OPAQUE_UNIFORM(Mod11, 16)

void register_mod11_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<Mod11, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
