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
        rev = "5e03ef6d6f19e54a55fa40b3e3064bdef277385f";
        hash = "sha256-ScEdh2kLBshmdbotqhaEycXX50/Jfoh2hG6lr4S0H2o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_math_util";
  version = "3.7.1-1";
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
    description = "A package with commonly used math utility code.";
  };
}
