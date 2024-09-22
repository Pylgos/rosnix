{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid_map_cmake_helpers,
  grid_map_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    grid_map_cv = substituteSource {
      src = fetchgit {
        name = "grid_map_cv-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "6504315ac27f69868585f914363ea1a1f345f250";
        hash = "sha256-Lp09fVPR5XQQzOBAN+e2yIboOKRcMBV7vLPniPun+LA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_cv";
  version = "2.2.0-1";
  src = sources.grid_map_cv;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge filters grid_map_cmake_helpers grid_map_core pluginlib rclcpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversions between grid maps and OpenCV images.";
  };
}
