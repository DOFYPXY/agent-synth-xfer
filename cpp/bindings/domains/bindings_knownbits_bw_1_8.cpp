#include "bindings_common.hpp"
#include "knownbits.hpp"

MAKE_OPAQUE_UNIFORM(KnownBits, 1)
MAKE_OPAQUE_UNIFORM(KnownBits, 2)
MAKE_OPAQUE_UNIFORM(KnownBits, 3)
MAKE_OPAQUE_UNIFORM(KnownBits, 4)
MAKE_OPAQUE_UNIFORM(KnownBits, 5)
MAKE_OPAQUE_UNIFORM(KnownBits, 6)
MAKE_OPAQUE_UNIFORM(KnownBits, 7)
MAKE_OPAQUE_UNIFORM(KnownBits, 8)

void register_knownbits_bindings_bw_1_8(py::module_ &m) {
  register_domain_widths<KnownBits, 1, 2, 3, 4, 5, 6, 7, 8>(m);
}
