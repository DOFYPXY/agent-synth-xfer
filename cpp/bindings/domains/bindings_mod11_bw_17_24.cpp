#include "bindings_common.hpp"
#include "mod.hpp"

MAKE_OPAQUE_UNIFORM(Mod11, 17)
MAKE_OPAQUE_UNIFORM(Mod11, 18)
MAKE_OPAQUE_UNIFORM(Mod11, 19)
MAKE_OPAQUE_UNIFORM(Mod11, 20)
MAKE_OPAQUE_UNIFORM(Mod11, 21)
MAKE_OPAQUE_UNIFORM(Mod11, 22)
MAKE_OPAQUE_UNIFORM(Mod11, 23)
MAKE_OPAQUE_UNIFORM(Mod11, 24)

void register_mod11_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<Mod11, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
