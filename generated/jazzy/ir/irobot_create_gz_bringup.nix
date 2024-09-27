{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gz_ros2_control,
  irobot_create_common_bringup,
  irobot_create_description,
  irobot_create_gz_toolbox,
  irobot_create_msgs,
  rosSystemPackages,
  ros_gz_bridge,
  ros_gz_interfaces,
  ros_gz_sim,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    irobot_create_gz_bringup-95d7acda183f66171e3a24bb75c395026f5a6630 = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_bringup-95d7acda183f66171e3a24bb75c395026f5a6630-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "95d7acda183f66171e3a24bb75c395026f5a6630";
        hash = "sha256-Sfg7l5+rnwMRG6DSEy5tGG9P20EjqhuNF/De6TeC1ps=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_gz_bringup";
  version = "3.0.2-2";
  src = sources.irobot_create_gz_bringup-95d7acda183f66171e3a24bb75c395026f5a6630;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs gz_ros2_control irobot_create_common_bringup irobot_create_description irobot_create_gz_toolbox irobot_create_msgs ros_gz_bridge ros_gz_interfaces ros_gz_sim std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides launch and configuration scripts for a Ignition simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
