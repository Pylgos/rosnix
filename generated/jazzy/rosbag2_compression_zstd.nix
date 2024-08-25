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
        rev = "79be289debf2763d704091f415e0766f1397907f";
        hash = "sha256-GYsTVG0fIt6dimaK74NGwhh8ps5R9pVU6ysA8nzQI0g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression_zstd";
  version = "0.26.4-1";
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
