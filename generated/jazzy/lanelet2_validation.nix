{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_projection,
  lanelet2_routing,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_validation = substituteSource {
      src = fetchgit {
        name = "lanelet2_validation-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "87bf0325bf0bae457a4dd104d10554118276f260";
        hash = "sha256-tAvB7lkQDSwBBpXUvHkuAzwo2zlSEbMsZr1Gy8AElXI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_validation";
  version = "1.2.1-1";
  src = sources.lanelet2_validation;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_io lanelet2_projection lanelet2_routing lanelet2_traffic_rules ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest lanelet2_maps ];
  missingDependencies = [  ];
  meta = {
    description = "Package for sanitizing lanelet maps";
  };
}
