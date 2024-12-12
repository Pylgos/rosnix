{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "eiquadprog";
  version = "1.2.9-1";
  src = finalAttrs.passthru.sources."eiquadprog";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "graphviz" ]; };
  passthru.sources = mkSourceSet (sources: {
    "eiquadprog" = substituteSource {
      src = fetchgit {
        name = "eiquadprog-source";
        url = "https://github.com/ros2-gbp/eiquadprog-release.git";
        rev = "edcd946a9274b06551318f4853054580168336dc";
        hash = "sha256-YYuPzbSrQfNzyXalOhhqfAUteYtSoTD4gIp16O3sLl4=";
      };
    };
  });
  meta = {
    description = "Eiquadprog a QP solver using active sets";
  };
})
