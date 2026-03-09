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
  rosSystemPackages,
  rosidl-default-generators,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_tools";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."data_tamer_tools";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ backward-ros data-tamer-cpp data-tamer-msgs foxglove-sdk-vendor geographic-msgs mcap-vendor rcl-interfaces rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ backward-ros data-tamer-cpp data-tamer-msgs foxglove-sdk-vendor geographic-msgs mcap-vendor rcl-interfaces rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-cmake-lint-cmake ament-index-cpp ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_tools" = substituteSource {
      src = fetchgit {
        name = "data_tamer_tools-source";
        url = "https://github.com/ros2-gbp/data_tamer_tools-release.git";
        rev = "3bbe5fc5e0ab88b232d87c8120741aa5f7824606";
        hash = "sha256-LtMJYNQ+hhCBdMLVcGbH3nBdIWUgW/HlZOJIhrzVwr8=";
      };
    };
  });
  meta = {
    description = "Set of tools for using Foxglove with data tamer";
  };
})
