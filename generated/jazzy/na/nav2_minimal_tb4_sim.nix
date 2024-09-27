{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_minimal_tb4_description,
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
    nav2_minimal_tb4_sim = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_sim-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "8761baaf35829730ab24dbd553f7d437b4a542dc";
        hash = "sha256-rQfuepSMdQIJmkfUmcjG45kyVyy1F0+Tz8RlKHKTujc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_minimal_tb4_sim";
  version = "1.0.1-1";
  src = sources.nav2_minimal_tb4_sim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav2_minimal_tb4_description robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_interfaces ros_gz_sim xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2 Minimum TurtleBot4 Simulation";
  };
}
