{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ouxt_lint_common,
  rclcpp,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    quaternion_operation = substituteSource {
      src = fetchgit {
        name = "quaternion_operation-source";
        url = "https://github.com/ros2-gbp/quaternion_operation-release.git";
        rev = "d10e808e983e6e3680b4dba4cf07ff15bd23e854";
        hash = "sha256-EOoZrowJNVGtJNutD+5WlSgVWbmOGlzSJyvsALmfji8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quaternion_operation";
  version = "0.0.7-4";
  src = sources.quaternion_operation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ouxt_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The quaternion_operation package";
  };
}
