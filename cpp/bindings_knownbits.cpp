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
MAKE_OPAQUE_UNIFORM(KnownBits, 9)
MAKE_OPAQUE_UNIFORM(KnownBits, 10)
MAKE_OPAQUE_UNIFORM(KnownBits, 11)
MAKE_OPAQUE_UNIFORM(KnownBits, 12)
MAKE_OPAQUE_UNIFORM(KnownBits, 13)
MAKE_OPAQUE_UNIFORM(KnownBits, 14)
MAKE_OPAQUE_UNIFORM(KnownBits, 15)
MAKE_OPAQUE_UNIFORM(KnownBits, 16)

void register_knownbits_bindings(py::module_ &m) {
  register_domain_widths<KnownBits, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                         14, 15, 16>(m);
}
