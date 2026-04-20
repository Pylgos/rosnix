{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  ros2-medkit-cmake,
  ros2-medkit-msgs,
  ros2-medkit-serialization,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-mcap,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_fault_manager";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_fault_manager";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros2-medkit-msgs ros2-medkit-serialization rosbag2-cpp rosbag2-storage rosbag2-storage-mcap ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libsqlite3-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ rclcpp ros2-medkit-msgs ros2-medkit-serialization rosbag2-cpp rosbag2-storage rosbag2-storage-mcap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing-ament-cmake launch-testing-ros sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_fault_manager" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_fault_manager-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "163ae3c35fdfc952e5e52f6fb4658dcda83e2941";
        hash = "sha256-M+ule3Q0VJiOVobRb8D8eMlZ+C6d2GYR9BsYmcibdsA=";
      };
    };
  });
  meta = {
    description = "Central fault manager node for ros2_medkit fault management system";
  };
})
