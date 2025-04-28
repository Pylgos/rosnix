{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rmw,
  rmw-security-common,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_dds_common";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."rmw_dds_common";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rcpputils ];
  propagatedBuildInputs = [ rcutils rmw rmw-security-common rosidl-default-runtime rosidl-runtime-c rosidl-runtime-cpp ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_dds_common" = substituteSource {
      src = fetchgit {
        name = "rmw_dds_common-source";
        url = "https://github.com/ros2-gbp/rmw_dds_common-release.git";
        rev = "5df45d46c43d4e11dab258e39e90b3d75d863739";
        hash = "sha256-zhRM5VblOQUtZV4/PVTuHonbbs3fs8dxyH1V3h1GhGY=";
      };
    };
  });
  meta = {
    description = "Define a common interface between DDS implementations of ROS middleware.";
  };
})
