{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros-core,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fastcdr,
  fastdds,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcpputils,
  rcutils,
  rmw,
  rmw-dds-common,
  rmw-fastrtps-shared-cpp,
  rosSystemPackages,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  test-msgs,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_fastrtps_dynamic_cpp";
  version = "9.3.2-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_dynamic_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake rcpputils ];
  propagatedBuildInputs = [ fastcdr fastdds rcutils rmw rmw-dds-common rmw-fastrtps-shared-cpp rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_fastrtps_dynamic_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_dynamic_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "7b65e11e6e0ec0df7f4dc524b67d56bb34a04d92";
        hash = "sha256-R6MYnVyo2A9ZrP+FoiN6JggscnCavX+xAZJIT7JyEN0=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using introspection type support.";
  };
})
