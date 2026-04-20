{
  action-msgs,
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  ros2-medkit-cmake,
  ros2-medkit-msgs,
  ros2-medkit-serialization,
  rosSystemPackages,
  rosidl-parser,
  rosidl-runtime-py,
  rosidl-typesupport-cpp,
  rosidl-typesupport-introspection-cpp,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_gateway";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_gateway";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ action-msgs ament-index-cpp rcl-interfaces rclcpp ros2-medkit-msgs ros2-medkit-serialization rosidl-parser rosidl-runtime-py rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp sensor-msgs std-msgs std-srvs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcpp-httplib-dev" "libsqlite3-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ action-msgs ament-index-cpp rcl-interfaces rclcpp ros2-medkit-msgs ros2-medkit-serialization rosidl-parser rosidl-runtime-py rosidl-typesupport-cpp rosidl-typesupport-introspection-cpp sensor-msgs std-msgs std-srvs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcpp-httplib-dev" "libsqlite3-dev" "libssl-dev" "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-gtest ament-lint-auto ament-lint-common example-interfaces rclcpp-action ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_gateway" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_gateway-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "045d2e4512257d97579834389e87b30938dbf5b3";
        hash = "sha256-0H3wkrMtaCRtZ2xlvOsSTHQ9NISxl05BPNIsPpsFWQk=";
      };
    };
  });
  meta = {
    description = "HTTP gateway for ros2_medkit diagnostics system";
  };
})
