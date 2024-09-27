{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  rosSystemPackages,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_interfaces,
  ros_gz_sim,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    nav2_minimal_tb3_sim-54c4b2648499e75baf33be986998e108f50d6490 = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb3_sim-54c4b2648499e75baf33be986998e108f50d6490-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "54c4b2648499e75baf33be986998e108f50d6490";
        hash = "sha256-ooAXS+KL4tKLDGNN5Esp22qX9t3i+RPs0BYlWK40mng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_minimal_tb3_sim";
  version = "1.0.1-1";
  src = sources.nav2_minimal_tb3_sim-54c4b2648499e75baf33be986998e108f50d6490;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_interfaces ros_gz_sim xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2 Minimum TurtleBot3 Simulation";
  };
}
