{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rcutils,
  rosbag2_compression,
  rosbag2_test_common,
  substituteSource,
  zstd_vendor,
}:
let
  sources = rec {
    rosbag2_compression_zstd = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression_zstd-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "a94fc1428065713fb8f519f960a6a66795c39d4f";
        hash = "sha256-C3SCDI13SaJNUsHgD54mdqJn2aDOzx2Aoba0JL8HfWM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression_zstd";
  version = "0.28.0-1";
  src = sources.rosbag2_compression_zstd;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rcutils rosbag2_compression zstd_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rclcpp rosbag2_test_common ];
  missingDependencies = [  ];
  meta = {
    description = "Zstandard compression library implementation of rosbag2_compression";
  };
}
