{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fastcdr,
  fastrtps,
  fastrtps-cmake-module,
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
  version = "9.1.0-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_dynamic_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake fastrtps-cmake-module ];
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw rmw-dds-common rmw-fastrtps-shared-cpp rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp test-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmw_fastrtps_dynamic_cpp" = substituteSource {
        src = fetchgit {
          name = "rmw_fastrtps_dynamic_cpp-source";
          url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
          rev = "16fd8954369ca07195bbd96340c3437de8b52f45";
          hash = "sha256-atL2lri8OlQ1lCugQK4d08bik9Cy5cxwv/ckLQOn21M=";
        };
      };
    });
  };
  meta = {
    description = "Implement the ROS middleware interface using introspection type support.";
  };
})
