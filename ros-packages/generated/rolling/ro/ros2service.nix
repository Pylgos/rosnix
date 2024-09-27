{
  ament_copyright,
  ament_flake8,
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
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2service-3e8a7ef2065c1a1e21e5555e47eb4173e953c934 = substituteSource {
      src = fetchgit {
        name = "ros2service-3e8a7ef2065c1a1e21e5555e47eb4173e953c934-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "3e8a7ef2065c1a1e21e5555e47eb4173e953c934";
        hash = "sha256-9W3jDKzG+3FeN34+2KE7hBQpqnR6MvwlvJujDtVlAkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2service";
  version = "0.34.1-1";
  src = sources.ros2service-3e8a7ef2065c1a1e21e5555e47eb4173e953c934;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The service command for ROS 2 command line tools.";
  };
}
