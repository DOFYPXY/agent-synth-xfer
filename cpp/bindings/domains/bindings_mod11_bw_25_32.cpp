#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod11, 25)
MAKE_OPAQUE_UNIFORM(Mod11, 26)
MAKE_OPAQUE_UNIFORM(Mod11, 27)
MAKE_OPAQUE_UNIFORM(Mod11, 28)
MAKE_OPAQUE_UNIFORM(Mod11, 29)
MAKE_OPAQUE_UNIFORM(Mod11, 30)
MAKE_OPAQUE_UNIFORM(Mod11, 31)
MAKE_OPAQUE_UNIFORM(Mod11, 32)

void register_mod11_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<Mod11, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
