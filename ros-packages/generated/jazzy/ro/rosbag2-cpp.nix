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
  rmw-implementation-cmake,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  rosbag2-test-msgdefs,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-cpp,
  rosidl-typesupport-introspection-cpp,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_cpp";
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp rcpputils rmw-implementation ];
  propagatedBuildInputs = [ pluginlib rcutils rmw rosbag2-storage rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rmw-implementation-cmake rosbag2-storage-default-plugins rosbag2-test-common rosbag2-test-msgdefs std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2515fce76d3a0bc8673cb7fd4fe4287b5c795226";
        hash = "sha256-/SffJ2VoztxZ2i8VE2ermee6SZO7LnO09dXX2UVbshI=";
      };
    };
  });
  meta = {
    description = "C++ ROSBag2 client library";
  };
})
