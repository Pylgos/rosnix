{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    color_util = substituteSource {
      src = fetchgit {
        name = "color_util-source";
        url = "https://github.com/ros2-gbp/color_util-release.git";
        rev = "231c6ee5d3a4330fa1d39e1085f260961d1acaf9";
        hash = "sha256-vHOcY7emyuuqZ06vo77SGvGnnV/T+wv1Va/tHUIGXIs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "color_util";
  version = "1.0.0-4";
  src = sources.color_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "An almost dependency-less library for converting between color spaces";
  };
}
