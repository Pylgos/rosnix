{
  ament-cmake,
  ament-cmake-gmock,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  rosbag2-test-msgdefs,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-cpp,
  rosidl-typesupport-introspection-cpp,
  shared-queues-vendor,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_cpp";
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp pluginlib rclcpp rcpputils rcutils rmw rmw-implementation rosbag2-storage rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp shared-queues-vendor ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-storage-default-plugins rosbag2-test-common rosbag2-test-msgdefs std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "35800c21412da65f82d01b8243e0dad1914bf3f1";
        hash = "sha256-XR388h7pkdLOdzsb4O6UlCr2XO1KJP+wm11/eqA6Weo=";
      };
    };
  });
  meta = {
    description = "C++ ROSBag2 client library";
  };
})
