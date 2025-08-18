{
  ament-cmake,
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
  version = "8.4.3-1";
  src = finalAttrs.passthru.sources."rmw_fastrtps_shared_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake fastcdr fastrtps fastrtps-cmake-module rcpputils rcutils rmw rmw-dds-common rosidl-dynamic-typesupport rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake fastcdr fastrtps fastrtps-cmake-module rcpputils rcutils rmw rmw-dds-common rosidl-dynamic-typesupport rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp tracetools ];
  checkInputs = [ ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_fastrtps_shared_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_shared_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "c72c436a32debee61538600da4eebf964acafd7b";
        hash = "sha256-abyxD/SGsV/foOOkYJEabZsuCeHCt+7DUv1N5xIczlE=";
      };
    };
  });
  meta = {
    description = "Code shared on static and dynamic type support of rmw_fastrtps_cpp.";
  };
})
