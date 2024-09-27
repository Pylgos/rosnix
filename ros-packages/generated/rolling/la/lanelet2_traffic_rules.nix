{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  mrt_cmake_modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_traffic_rules-d6fd6456b876951728965f2c46963305ba532373 = substituteSource {
      src = fetchgit {
        name = "lanelet2_traffic_rules-d6fd6456b876951728965f2c46963305ba532373-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "d6fd6456b876951728965f2c46963305ba532373";
        hash = "sha256-4z23mvgIB58yuFaSmCW3z5im50f74rrIYVTXxo8XYRA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_traffic_rules";
  version = "1.2.1-6";
  src = sources.lanelet2_traffic_rules-d6fd6456b876951728965f2c46963305ba532373;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt_cmake_modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Package for interpreting traffic rules in a lanelet map";
  };
}
