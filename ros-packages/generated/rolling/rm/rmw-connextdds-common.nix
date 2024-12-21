{
  ament-cmake,
  ament-cmake-ros,
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
  version = "0.25.0-1";
  src = finalAttrs.passthru.sources."rmw_connextdds_common";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fastcdr rcpputils rcutils rmw rmw-dds-common rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-fastrtps-c rosidl-typesupport-fastrtps-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp rti-connext-dds-cmake-module tracetools ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_connextdds_common" = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds_common-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "dcd463db742ed6296c2827be0c21f90044d60ce4";
        hash = "sha256-iUeYoaTP2ywhJ8XUNTEA7jFgPK8YFr4u9M2lQLFaN0g=";
      };
    };
  });
  meta = {
    description = "Common source for RMW implementations built with RTI Connext DDS Professional and RTI Connext DDS Micro.";
  };
})
