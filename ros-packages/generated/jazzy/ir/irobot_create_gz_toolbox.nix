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
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  irobot_create_toolbox,
  mkSourceSet,
  nav_msgs,
  rclcpp,
  rclcpp_action,
  rcutils,
  rosSystemPackages,
  ros_gz_interfaces,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_gz_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gz_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "ada75bad2e41122c32af63843c74f5826fdf816b";
        hash = "sha256-VYTMIj+MLARWxYH91hYlU3sej6qrAsoHZfKHrmJGx/w=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_gz_toolbox";
  version = "3.0.2-2";
  src = sources."irobot_create_gz_toolbox";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control_msgs irobot_create_msgs irobot_create_toolbox nav_msgs rclcpp rclcpp_action rcutils ros_gz_interfaces sensor_msgs std_msgs tf2 tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nodes and tools for simulating in Ignition iRobot(R) Create(R) 3 Educational Robot.";
  };
}
