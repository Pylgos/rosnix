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
  version = "0.32.0-1";
  src = finalAttrs.passthru.sources."rosbag2_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rcpputils rmw-implementation ];
  propagatedBuildInputs = [ pluginlib rclcpp rcutils rmw rosbag2-storage rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rmw-implementation-cmake rosbag2-storage-default-plugins rosbag2-test-common rosbag2-test-msgdefs std-msgs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_cpp" = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "85abe6a754e87681a9e36d5c48a45fa28c31ab89";
        hash = "sha256-CqO8rqjIlwGZaIume7HTbsuuTOWOgvvpzXWoATIivWY=";
      };
    };
  });
  meta = {
    description = "C++ ROSBag2 client library";
  };
})
