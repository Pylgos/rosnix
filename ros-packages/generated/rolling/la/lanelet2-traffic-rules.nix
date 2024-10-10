{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "lanelet2_traffic_rules" = substituteSource {
      src = fetchgit {
        name = "lanelet2_traffic_rules-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "d6fd6456b876951728965f2c46963305ba532373";
        hash = "sha256-4z23mvgIB58yuFaSmCW3z5im50f74rrIYVTXxo8XYRA=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_traffic_rules";
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_traffic_rules";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Package for interpreting traffic rules in a lanelet map";
  };
})
