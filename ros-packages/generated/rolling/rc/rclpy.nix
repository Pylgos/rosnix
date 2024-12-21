{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  pybind11-vendor,
  rcl,
  rcl-action,
  rcl-interfaces,
  rcl-lifecycle,
  rcl-logging-interface,
  rcl-yaml-param-parser,
  rcpputils,
  rcutils,
  rmw,
  rmw-implementation,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosgraph-msgs,
  rosidl-generator-py,
  rosidl-runtime-c,
  rpyutils,
  substituteSource,
  test-msgs,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclpy";
  version = "8.0.0-1";
  src = finalAttrs.passthru.sources."rclpy";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-implementation-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-yaml" ]; };
  propagatedBuildInputs = [ action-msgs ament-index-python builtin-interfaces lifecycle-msgs pybind11-vendor rcl rcl-action rcl-interfaces rcl-lifecycle rcl-logging-interface rcl-yaml-param-parser rcpputils rcutils rmw rmw-implementation rosgraph-msgs rosidl-runtime-c rpyutils unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-typing-extensions" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rosidl-generator-py test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rclpy" = substituteSource {
      src = fetchgit {
        name = "rclpy-source";
        url = "https://github.com/ros2-gbp/rclpy-release.git";
        rev = "aaf2e83bef2579329822220f79b79eb11eeb0d61";
        hash = "sha256-0H5yxcf/haUnw2Tm9haJ4SSpuL6yF+Va0T2VjruLXsY=";
      };
    };
  });
  meta = {
    description = "Package containing the Python client.";
  };
})
