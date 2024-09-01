{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  ros_gz_bridge,
  substituteSource,
}:
let
  sources = rec {
    test_ros_gz_bridge = substituteSource {
      src = fetchgit {
        name = "test_ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "587e20cfa0441f304ccc7d93bfbd86981f1ce965";
        hash = "sha256-AMkYg34fgDEmW5BTiktHR5QZLZu4cYR8eTunZ5KwY5o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_ros_gz_bridge";
  version = "1.0.4-1";
  src = sources.test_ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch_ros launch_testing launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
}
