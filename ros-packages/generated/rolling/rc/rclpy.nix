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
  service-msgs,
  substituteSource,
  test-msgs,
  type-description-interfaces,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclpy";
  version = "9.2.0-1";
  src = finalAttrs.passthru.sources."rclpy";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcpputils rmw-implementation rmw-implementation-cmake rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-yaml" ]; };
  propagatedBuildInputs = [ action-msgs ament-index-python builtin-interfaces lifecycle-msgs pybind11-vendor rcl rcl-action rcl-interfaces rcl-lifecycle rcl-logging-interface rcl-yaml-param-parser rcutils rmw rosgraph-msgs rosidl-runtime-c service-msgs type-description-interfaces unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-typing-extensions" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rosidl-generator-py test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rclpy" = substituteSource {
      src = fetchgit {
        name = "rclpy-source";
        url = "https://github.com/ros2-gbp/rclpy-release.git";
        rev = "64ac7acd2080e2ebf6c2b69588c7e86aaf80968d";
        hash = "sha256-B2kapOUCN2JhreZnNM/oKuqTBCj735H/LgItez1xUyc=";
      };
    };
  });
  meta = {
    description = "Package containing the Python client.";
  };
})
