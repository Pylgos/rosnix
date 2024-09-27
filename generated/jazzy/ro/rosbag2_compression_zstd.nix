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
  rosSystemPackages,
  rosbag2_compression,
  rosbag2_test_common,
  substituteSource,
  zstd_vendor,
}:
let
  sources = rec {
    rosbag2_compression_zstd-3f3c01609c3bef74cfc3f3229b0d57964c6bd465 = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression_zstd-3f3c01609c3bef74cfc3f3229b0d57964c6bd465-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "3f3c01609c3bef74cfc3f3229b0d57964c6bd465";
        hash = "sha256-bqsmwtbjweCojt3neyXtpzwtXCgTBGd7nOdMQZiabVY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression_zstd";
  version = "0.26.5-1";
  src = sources.rosbag2_compression_zstd-3f3c01609c3bef74cfc3f3229b0d57964c6bd465;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rcutils rosbag2_compression zstd_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rclcpp rosbag2_test_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Zstandard compression library implementation of rosbag2_compression";
  };
}
