{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_ros-841f2b9893bfef6d15c70afa2f5bbac9c15e5062 = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-841f2b9893bfef6d15c70afa2f5bbac9c15e5062-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "841f2b9893bfef6d15c70afa2f5bbac9c15e5062";
        hash = "sha256-zqVLQwEz68ZeVjyxK084Bm8wv8Va8lBs5A5RhoAOJLY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ros";
  version = "0.27.2-1";
  src = sources.launch_testing_ros-841f2b9893bfef6d15c70afa2f5bbac9c15e5062;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python launch_ros launch_testing rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A package providing utilities for writing ROS2 enabled launch tests.";
  };
}
