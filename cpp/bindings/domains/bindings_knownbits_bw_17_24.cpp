#include "bindings_common.hpp"
#include "knownbits.hpp"

MAKE_OPAQUE_UNIFORM(KnownBits, 17)
MAKE_OPAQUE_UNIFORM(KnownBits, 18)
MAKE_OPAQUE_UNIFORM(KnownBits, 19)
MAKE_OPAQUE_UNIFORM(KnownBits, 20)
MAKE_OPAQUE_UNIFORM(KnownBits, 21)
MAKE_OPAQUE_UNIFORM(KnownBits, 22)
MAKE_OPAQUE_UNIFORM(KnownBits, 23)
MAKE_OPAQUE_UNIFORM(KnownBits, 24)

void register_knownbits_bindings_bw_17_24(py::module_ &m) {
  register_domain_widths<KnownBits, 17, 18, 19, 20, 21, 22, 23, 24>(m);
}
