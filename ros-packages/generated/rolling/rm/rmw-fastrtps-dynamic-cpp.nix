{
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
  rosidl-buffer,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  test-msgs,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_fastrtps_dynamic_cpp";
  version = "9.5.0-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_dynamic_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ fastcdr fastdds rcpputils rcutils rmw rmw-dds-common rmw-fastrtps-shared-cpp rosidl-buffer rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ fastcdr fastdds rcpputils rcutils rmw rmw-dds-common rmw-fastrtps-shared-cpp rosidl-buffer rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_fastrtps_dynamic_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_dynamic_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "73582efe49c59ad5fe5c260fa4b798bdf673435b";
        hash = "sha256-TjiWFjDiXqchsl/ND5pnypWxljASM/7WqE3kXBLJRaw=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using introspection type support.";
  };
})
