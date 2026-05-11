{
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
  rosidl-buffer-backend-registry,
  rosidl-dynamic-typesupport,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_fastrtps_shared_cpp";
  version = "9.5.0-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_shared_cpp";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ fastcdr fastdds rcpputils rcutils rmw rmw-dds-common rmw-security-common rosidl-buffer-backend-registry rosidl-dynamic-typesupport rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ fastcdr fastdds rcpputils rcutils rmw rmw-dds-common rmw-security-common rosidl-buffer-backend-registry rosidl-dynamic-typesupport rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_fastrtps_shared_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_shared_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "df30fae100203ad7c02ee0a7f2cf80ced066a4ea";
        hash = "sha256-V4/tCG9wjf4UOSC1SNaoITgNHdBuVONBd+HXRcHXKpA=";
      };
    };
  });
  meta = {
    description = "Code shared on static and dynamic type support of rmw_fastrtps_cpp.";
  };
})
