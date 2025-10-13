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
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."rmw_zenoh_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp fastcdr rcpputils rcutils rmw rmw-test-fixture rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp tracetools zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp fastcdr rcpputils rcutils rmw rmw-test-fixture rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp tracetools zenoh-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_zenoh_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_zenoh_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "d7602c32b40fa31e7a8b156306fe7802ce7723da";
        hash = "sha256-msnAzdaKk2DeNOHgtgiAHaQy3NI9INoHI1s43Ua1lCc=";
      };
    };
  });
  meta = {
    description = "A ROS 2 middleware implementation using zenoh-cpp";
  };
})
