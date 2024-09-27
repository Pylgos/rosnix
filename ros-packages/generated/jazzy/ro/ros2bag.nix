{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ros,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosbag2_py,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  substituteSource,
}:
let
  sources = rec {
    ros2bag-d5418e17655d72763d6a2f88982d5cc347477e42 = substituteSource {
      src = fetchgit {
        name = "ros2bag-d5418e17655d72763d6a2f88982d5cc347477e42-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d5418e17655d72763d6a2f88982d5cc347477e42";
        hash = "sha256-iWXoKIBIZLwf+Zy7UaVeP09RVwtFDK3eHh5lRgFncP0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2bag";
  version = "0.26.5-1";
  src = sources.ros2bag-d5418e17655d72763d6a2f88982d5cc347477e42;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python rclpy ros2cli rosbag2_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch_testing launch_testing_ros rosbag2_storage_default_plugins rosbag2_test_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Entry point for rosbag in ROS 2";
  };
}
