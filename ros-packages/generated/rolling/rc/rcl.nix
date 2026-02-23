{
  ament-cmake-gen-version-h,
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
  rcl-logging-implementation,
  rcl-logging-interface,
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
  version = "10.3.1-1";
  src = finalAttrs.passthru.sources."rcl";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ libyaml-vendor rcl-interfaces rcl-logging-implementation rcl-logging-interface rcl-yaml-param-parser rcutils rmw rmw-implementation rosidl-runtime-c service-msgs tracetools type-description-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml" ]; };
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ libyaml-vendor rcl-interfaces rcl-logging-implementation rcl-logging-interface rcl-yaml-param-parser rcutils rmw rmw-implementation rosidl-runtime-c service-msgs tracetools type-description-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp rmw rmw-implementation-cmake rosidl-runtime-cpp test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rcl" = substituteSource {
      src = fetchgit {
        name = "rcl-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "e90904b9c44e9a0530c573c878433631062b21e3";
        hash = "sha256-t35OPIhAdEv1q0RLvEpYl7Qja4yV6W+nEW+hQQ7TJB0=";
      };
    };
  });
  meta = {
    description = "The ROS client library common implementation.\n    This package contains an API which builds on the ROS middleware API and is optionally built upon by the other ROS client libraries.\n  ";
  };
})
