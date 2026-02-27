#include "bindings_common.hpp"
#include "knownbits.hpp"

MAKE_OPAQUE_UNIFORM(KnownBits, 9)
MAKE_OPAQUE_UNIFORM(KnownBits, 10)
MAKE_OPAQUE_UNIFORM(KnownBits, 11)
MAKE_OPAQUE_UNIFORM(KnownBits, 12)
MAKE_OPAQUE_UNIFORM(KnownBits, 13)
MAKE_OPAQUE_UNIFORM(KnownBits, 14)
MAKE_OPAQUE_UNIFORM(KnownBits, 15)
MAKE_OPAQUE_UNIFORM(KnownBits, 16)

void register_knownbits_bindings_bw_9_16(py::module_ &m) {
  register_domain_widths<KnownBits, 9, 10, 11, 12, 13, 14, 15, 16>(m);
}
