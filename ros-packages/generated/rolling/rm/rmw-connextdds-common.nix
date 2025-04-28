{
  ament-cmake,
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
  rmw-dds-common,
  rmw-security-common,
  rosSystemPackages,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-fastrtps-cpp,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  rti-connext-dds-cmake-module,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_connextdds_common";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."rmw_connextdds_common";
  propagatedNativeBuildInputs = [ ament-cmake rcpputils ];
  propagatedBuildInputs = [ fastcdr rcutils rmw rmw-dds-common rmw-security-common rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp rti-connext-dds-cmake-module tracetools ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds_common" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds_common-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "1b20fed8c475a1fa51e572e2a3ab7d46fb6797cd";
        hash = "sha256-G+XKIlk+a6cOtPVMdak3U1IWsK0Zv1VaMcnc7RnbeCE=";
      };
    };
  });
  meta = {
    description = "Common source for RMW implementations built with RTI Connext DDS Professional and RTI Connext DDS Micro.";
  };
})
