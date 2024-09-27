{
  ament_cmake,
  ament_cmake_black,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_mypy,
  ament_cmake_xmllint,
  ament_index_python,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_description,
  leo_gz_plugins,
  leo_gz_worlds,
  robot_state_publisher,
  rosSystemPackages,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    leo_gz_bringup = substituteSource {
      src = fetchgit {
        name = "leo_gz_bringup-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "09ae0956938149841ea2ec9ad8ce738aec9beec6";
        hash = "sha256-0y/ePaYkD004cZ1wt5INnVSgdpRwZiQHUTGqphJgZoI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_bringup";
  version = "2.0.0-1";
  src = sources.leo_gz_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python leo_description leo_gz_plugins leo_gz_worlds robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_sim xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_black ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_mypy ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Bringup package for Leo Rover Gazebo simulation in ROS 2";
  };
}
