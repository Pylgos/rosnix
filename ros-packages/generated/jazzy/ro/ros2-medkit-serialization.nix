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
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rcutils,
  ros2-medkit-cmake,
  rosSystemPackages,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_serialization";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_serialization";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rcpputils rcutils rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ rclcpp rcpputils rcutils rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs sensor-msgs std-msgs std-srvs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_serialization" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_serialization-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "05525e5c4b91a82a60e8a99a376690cf69cc00f1";
        hash = "sha256-FpJens4cBKpJ7LX9hKPwPsCwj/KjLO9iuWUAqrO3UQc=";
      };
    };
  });
  meta = {
    description = "Runtime JSON to ROS 2 message serialization library";
  };
})
