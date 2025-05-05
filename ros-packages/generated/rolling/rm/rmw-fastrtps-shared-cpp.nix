{
  ament-cmake,
  ament-cmake-gmock,
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
  rmw-security-common,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_fastrtps_shared_cpp";
  version = "9.4.0-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_shared_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake fastcdr fastdds rcpputils rcutils rmw rmw-dds-common rmw-security-common rosidl-dynamic-typesupport rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake fastcdr fastdds rcpputils rcutils rmw rmw-dds-common rmw-security-common rosidl-dynamic-typesupport rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_fastrtps_shared_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_shared_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "61c0a526f450e664249c814aa2e8029aa0f2e846";
        hash = "sha256-RIUE3cJW0xHZrXU4ZtJfdxJB5IedgJdIVitRbHp7V6M=";
      };
    };
  });
  meta = {
    description = "Code shared on static and dynamic type support of rmw_fastrtps_cpp.";
  };
})
