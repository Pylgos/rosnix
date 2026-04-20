{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-index-cpp,
  ament-lint,
  backward-ros,
  buildAmentCmakePackage,
  data-tamer-cpp,
  data-tamer-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  foxglove-sdk-vendor,
  geographic-msgs,
  mcap-vendor,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_tools";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."data_tamer_tools";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ backward-ros data-tamer-cpp data-tamer-msgs foxglove-sdk-vendor geographic-msgs mcap-vendor rcl-interfaces rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ backward-ros data-tamer-cpp data-tamer-msgs foxglove-sdk-vendor geographic-msgs mcap-vendor rcl-interfaces rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-cmake-lint-cmake ament-index-cpp ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_tools" = substituteSource {
      src = fetchgit {
        name = "data_tamer_tools-source";
        url = "https://github.com/ros2-gbp/data_tamer_tools-release.git";
        rev = "c992f3693c67a7cd8cbadcf7ab17f6d91462c3d4";
        hash = "sha256-4Ng6f9OKvID9MgF6bXmxsjgQi++/HfFqlLMFOJBIrwc=";
      };
    };
  });
  meta = {
    description = "Set of tools for using Foxglove with data tamer";
  };
})
