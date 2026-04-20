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
  version = "4.3.0-1";
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
        rev = "20551377ab534a2a92800d92b9a3868bea6c1487";
        hash = "sha256-f0H9sqjffuBotnoBybLQE62mI598A3Oi6UW8EOtsPJw=";
      };
    };
  });
  meta = {
    description = "\n    A bond allows two processes, A and B, to know when the other has\n    terminated, either cleanly or by crashing. The bond remains\n    connected until it is either broken explicitly or until a\n    heartbeat times out.\n  ";
  };
})
