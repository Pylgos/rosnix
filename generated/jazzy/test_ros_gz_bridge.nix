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
        rev = "e76dc3d5a87f19bddbacec8354d047275c6abd08";
        hash = "sha256-s3cG7YCDrtAL5F45Iq+qoqx55jLEnLdvPOh1NLCEbZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_ros_gz_bridge";
  version = "1.0.3-1";
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
