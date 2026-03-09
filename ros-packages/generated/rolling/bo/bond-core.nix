{
  ament-cmake,
  bond,
  bondcpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bond_core";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."bond_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bond bondcpp smclib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond bondcpp smclib ];
  passthru.sources = mkSourceSet (sources: {
    "bond_core" = substituteSource {
      src = fetchgit {
        name = "bond_core-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "d64ccf617db3040efe5ee0af15ab9e7efa602aa8";
        hash = "sha256-2fN1iJmc/CGCPpBJRCTc4AGxlRUY35Av4Qk6fL5S1cQ=";
      };
    };
  });
  meta = {
    description = "\n    A bond allows two processes, A and B, to know when the other has\n    terminated, either cleanly or by crashing. The bond remains\n    connected until it is either broken explicitly or until a\n    heartbeat times out.\n  ";
  };
})
