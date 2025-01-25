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
  version = "4.1.2-1";
  src = finalAttrs.passthru.sources."bond_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond bondcpp smclib ];
  passthru.sources = mkSourceSet (sources: {
    "bond_core" = substituteSource {
      src = fetchgit {
        name = "bond_core-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "f60c882d0e530582172d81bafc996baa6daf57ac";
        hash = "sha256-I8Q3WykFT4Tk8fI2wo6Ca2/sTmoCYfOlI8Dbrugx+F0=";
      };
    };
  });
  meta = {
    description = "A bond allows two processes, A and B, to know when the other has terminated, either cleanly or by crashing. The bond remains connected until it is either broken explicitly or until a heartbeat times out.";
  };
})
