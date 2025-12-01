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
  mcap-vendor,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_tools";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."data_tamer_tools";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ backward-ros data-tamer-cpp data-tamer-msgs foxglove-sdk-vendor mcap-vendor rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ backward-ros data-tamer-cpp data-tamer-msgs foxglove-sdk-vendor mcap-vendor rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "protobuf-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-cmake-lint-cmake ament-index-cpp ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_tools" = substituteSource {
      src = fetchgit {
        name = "data_tamer_tools-source";
        url = "https://github.com/jlack1987/data_tamer_tools-release.git";
        rev = "d88e2092b4cded66caf76dd621d21727a1fbbc9b";
        hash = "sha256-TV71bUBKqQDyoNMnVhPOJITfgtYkznMX3SkZR/C1SFo=";
      };
    };
  });
  meta = {
    description = "Set of tools for using Foxglove with data tamer";
  };
})
