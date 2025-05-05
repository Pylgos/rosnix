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
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_dds_common";
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."rmw_dds_common";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rcpputils rcutils rmw rosidl-default-runtime rosidl-runtime-c rosidl-runtime-cpp ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rcpputils rcutils rmw rosidl-default-runtime rosidl-runtime-c rosidl-runtime-cpp ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_dds_common" = substituteSource {
      src = fetchgit {
        name = "rmw_dds_common-source";
        url = "https://github.com/ros2-gbp/rmw_dds_common-release.git";
        rev = "8d736a951300b342b1d672e7923ad9c50f04f726";
        hash = "sha256-wc3HbuwzxNPLut+Q0TPcQI5xPIZd1euV/y2t3Acat8k=";
      };
    };
  });
  meta = {
    description = "Define a common interface between DDS implementations of ROS middleware.";
  };
})
