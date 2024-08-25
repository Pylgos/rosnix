{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    swri_math_util = substituteSource {
      src = fetchgit {
        name = "swri_math_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "0b2609025c1fa8126c8d3639987d8c92b38f849a";
        hash = "sha256-H/negEcGvBrltnGov5f1eOUia7jrj9xoYDkLioffbTg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_math_util";
  version = "3.6.1-2";
  src = sources.swri_math_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "swri_math_util";
  };
}
