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
  angles,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_msgs,
  irobot_create_toolbox,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    irobot_create_nodes-9820518e7ad3fd36c67bcd9d217eda7813d62421 = substituteSource {
      src = fetchgit {
        name = "irobot_create_nodes-9820518e7ad3fd36c67bcd9d217eda7813d62421-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "9820518e7ad3fd36c67bcd9d217eda7813d62421";
        hash = "sha256-JELgQIoTr3G3GURg9exPGAofcJxoYI7FdjnKC7FiVc8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_nodes";
  version = "3.0.2-2";
  src = sources.irobot_create_nodes-9820518e7ad3fd36c67bcd9d217eda7813d62421;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles control_msgs geometry_msgs irobot_create_msgs irobot_create_toolbox nav_msgs rclcpp rclcpp_action rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 Nodes for the simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
}
