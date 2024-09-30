{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcutils,
  rmw,
  rosSystemPackages,
  rosbag2-test-common,
  substituteSource,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "rosbag2_storage" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d18cee94dee5e63100a1aec9b6ac9f630067e2ab";
        hash = "sha256-S/wzJU8dNHCoPkI7IEZv0ItwTRWZ76TA3v0KGJaGFZA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosbag2_storage";
  version = "0.29.0-1";
  src = sources."rosbag2_storage";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rclcpp rcutils rmw yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common rosbag2-test-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 independent storage format to store serialized ROS2 messages";
  };
}
