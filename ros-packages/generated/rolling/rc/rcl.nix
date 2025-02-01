{
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  libyaml-vendor,
  mimick-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl-interfaces,
  rcl-logging-interface,
  rcl-logging-noop,
  rcl-logging-spdlog,
  rcl-yaml-param-parser,
  rcutils,
  rmw,
  rmw-implementation,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  service-msgs,
  substituteSource,
  test-msgs,
  tracetools,
  type-description-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl";
  version = "10.0.2-1";
  src = finalAttrs.passthru.sources."rcl";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ libyaml-vendor rcl-interfaces rcl-logging-interface rcl-logging-noop rcl-logging-spdlog rcl-yaml-param-parser rcutils rmw rmw-implementation rosidl-runtime-c service-msgs tracetools type-description-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp rmw rmw-implementation-cmake rosidl-runtime-cpp test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rcl" = substituteSource {
      src = fetchgit {
        name = "rcl-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "279f8c3ca36892ef603e3b5811aa778bf708c3f9";
        hash = "sha256-iVU7/xwwWK7i/U2GEtL7/kL/nXD3qbIayID4QsH9Nic=";
      };
    };
  });
  meta = {
    description = "The ROS client library common implementation. This package contains an API which builds on the ROS middleware API and is optionally built upon by the other ROS client libraries.";
  };
})
