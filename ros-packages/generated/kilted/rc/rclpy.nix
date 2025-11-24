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
  version = "9.1.3-1";
  src = finalAttrs.passthru.sources."rclpy";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs ament-index-python builtin-interfaces lifecycle-msgs pybind11-vendor rcl rcl-action rcl-interfaces rcl-lifecycle rcl-logging-interface rcl-yaml-param-parser rcpputils rcutils rmw rmw-implementation rmw-implementation-cmake rosgraph-msgs rosidl-runtime-c rpyutils service-msgs type-description-interfaces unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-typing-extensions" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs ament-index-python builtin-interfaces lifecycle-msgs pybind11-vendor rcl rcl-action rcl-interfaces rcl-lifecycle rcl-logging-interface rcl-yaml-param-parser rcpputils rcutils rmw rmw-implementation rmw-implementation-cmake rosgraph-msgs rosidl-runtime-c rpyutils service-msgs type-description-interfaces unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" "python3-typing-extensions" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rosidl-generator-py test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rclpy" = substituteSource {
      src = fetchgit {
        name = "rclpy-source";
        url = "https://github.com/ros2-gbp/rclpy-release.git";
        rev = "1a6c17def4776f435aa03123b6c889e562bdbd60";
        hash = "sha256-ifhtOQMz2bFo4vyOh/E6VzVow3wkevaw/Sbh18NrlFo=";
      };
    };
  });
  meta = {
    description = "Package containing the Python client.";
  };
})
