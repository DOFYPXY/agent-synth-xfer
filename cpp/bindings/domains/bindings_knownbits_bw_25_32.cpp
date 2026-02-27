#include "bindings_common.hpp"
#include "knownbits.hpp"

MAKE_OPAQUE_UNIFORM(KnownBits, 25)
MAKE_OPAQUE_UNIFORM(KnownBits, 26)
MAKE_OPAQUE_UNIFORM(KnownBits, 27)
MAKE_OPAQUE_UNIFORM(KnownBits, 28)
MAKE_OPAQUE_UNIFORM(KnownBits, 29)
MAKE_OPAQUE_UNIFORM(KnownBits, 30)
MAKE_OPAQUE_UNIFORM(KnownBits, 31)
MAKE_OPAQUE_UNIFORM(KnownBits, 32)

void register_knownbits_bindings_bw_25_32(py::module_ &m) {
  register_domain_widths<KnownBits, 25, 26, 27, 28, 29, 30, 31, 32>(m);
}
