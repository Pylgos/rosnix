{
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  libstatistics-collector,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcl-interfaces,
  rcl-logging-interface,
  rcl-yaml-param-parser,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosgraph-msgs,
  rosidl-default-generators,
  rosidl-dynamic-typesupport,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-c,
  rosidl-typesupport-cpp,
  statistics-msgs,
  substituteSource,
  test-msgs,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclcpp";
  version = "28.1.9-1";
  src = finalAttrs.passthru.sources."rclcpp";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp libstatistics-collector rcl rcl-logging-interface rcl-yaml-param-parser rcpputils rosidl-dynamic-typesupport tracetools ];
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp libstatistics-collector rcl rcl-logging-interface rcl-yaml-param-parser rcpputils rosidl-dynamic-typesupport tracetools ];
  depsTargetTargetPropagated = [ builtin-interfaces rcl-interfaces rcutils rmw rosgraph-msgs rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-cpp statistics-msgs ];
  checkInputs = [ ament-cmake-gmock ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rmw rmw-implementation-cmake rosidl-default-generators test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp" = substituteSource {
      src = fetchgit {
        name = "rclcpp-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "e58319c47af90f67b518b08a913a2545736574ca";
        hash = "sha256-CzW54pldLMulDpIIg+6SMJgNO8PSoAv/Q6ip4Kgc6QE=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C++.";
  };
})
