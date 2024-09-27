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
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  ros_environment,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ros2doctor" = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "de0f2b78fac592f82ef568a19fdb0bf63a19b92d";
        hash = "sha256-JXBAZbli5oJOfIgCmMgvtoe2omh/HSe5ghJP6JBBxms=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros2doctor";
  version = "0.32.1-1";
  src = sources."ros2doctor";
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
