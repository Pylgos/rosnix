{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  rclpy,
  ros2cli,
  rosSystemPackages,
  ros_environment,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros2doctor = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "9a4760227b98da3d206e2e0a2dc5585565536bf1";
        hash = "sha256-Egl9rcKcli2aH9MwTCpIE61o6vHC0NmdCKSz/qdi8pk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2doctor";
  version = "0.34.1-1";
  src = sources.ros2doctor;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-importlib-metadata" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rclpy ros2cli std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" "python3-rosdistro-modules" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "A command line tool to check potential issues in a ROS 2 system";
  };
}
