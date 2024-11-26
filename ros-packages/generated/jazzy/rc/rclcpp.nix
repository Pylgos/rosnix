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
  version = "28.1.5-1";
  src = finalAttrs.passthru.sources."rclcpp";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  propagatedBuildInputs = [ ament-index-cpp builtin-interfaces libstatistics-collector rcl rcl-interfaces rcl-logging-interface rcl-yaml-param-parser rcpputils rcutils rmw rosgraph-msgs rosidl-dynamic-typesupport rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-c rosidl-typesupport-cpp statistics-msgs tracetools ];
  checkInputs = [ ament-cmake-gmock ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rmw rmw-implementation-cmake rosidl-default-generators test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclcpp" = substituteSource {
      src = fetchgit {
        name = "rclcpp-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "725693dab47a5b65aa8631b4fe03bfa21fe5ea7f";
        hash = "sha256-BMNYlzGpWN34ozMIk2Lvte6dN0QxJ0yxGs0VeTxYnFs=";
      };
    };
  });
  meta = {
    description = "The ROS client library in C++.";
  };
})
