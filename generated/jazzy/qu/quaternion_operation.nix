{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ouxt_lint_common,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    quaternion_operation-5caa679fcf2a9098a3c9fb91fe47c62b4006baf6 = substituteSource {
      src = fetchgit {
        name = "quaternion_operation-5caa679fcf2a9098a3c9fb91fe47c62b4006baf6-source";
        url = "https://github.com/ros2-gbp/quaternion_operation-release.git";
        rev = "5caa679fcf2a9098a3c9fb91fe47c62b4006baf6";
        hash = "sha256-EOoZrowJNVGtJNutD+5WlSgVWbmOGlzSJyvsALmfji8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "quaternion_operation";
  version = "0.0.7-5";
  src = sources.quaternion_operation-5caa679fcf2a9098a3c9fb91fe47c62b4006baf6;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ouxt_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The quaternion_operation package";
  };
}
