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
  version = "4.2.0-1";
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
        rev = "e32b3c79db50199ab61b1d186d26836ccbecfae9";
        hash = "sha256-eg9+zUBVdhV3PXaTL/1cCtx9x0dCsV70EwdlRqAqLDI=";
      };
    };
  });
  meta = {
    description = "\n    A bond allows two processes, A and B, to know when the other has\n    terminated, either cleanly or by crashing. The bond remains\n    connected until it is either broken explicitly or until a\n    heartbeat times out.\n  ";
  };
})
