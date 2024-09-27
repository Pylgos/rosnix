{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosgraph_msgs,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2topic-19eb05116f36443a8396099d3055c761393c472f = substituteSource {
      src = fetchgit {
        name = "ros2topic-19eb05116f36443a8396099d3055c761393c472f-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "19eb05116f36443a8396099d3055c761393c472f";
        hash = "sha256-ZEM7PvTOiXF1b8TozI1nkGImCrNW57lDt304Fa1n0yE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2topic";
  version = "0.34.1-1";
  src = sources.ros2topic-19eb05116f36443a8396099d3055c761393c472f;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint geometry_msgs launch launch_ros launch_testing launch_testing_ros rosgraph_msgs std_msgs test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The topic command for ROS 2 command line tools.";
  };
}
