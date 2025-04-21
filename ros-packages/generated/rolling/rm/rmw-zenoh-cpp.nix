{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-test-fixture,
  rosSystemPackages,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-fastrtps-cpp,
  substituteSource,
  tracetools,
  zenoh-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_zenoh_cpp";
  version = "0.6.0-1";
  src = finalAttrs.passthru.sources."rmw_zenoh_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp rcpputils rmw-test-fixture ];
  propagatedBuildInputs = [ fastcdr rcutils rmw rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp tracetools zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_zenoh_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_zenoh_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "c1e0f0e145c9bd23b63dbbe0b67e32dd908b9b20";
        hash = "sha256-doBqT2ZYpLIaE+JGKCTSP4XQNwktZGeF5os+VTREMjY=";
      };
    };
  });
  meta = {
    description = "A ROS 2 middleware implementation using zenoh-cpp";
  };
})
