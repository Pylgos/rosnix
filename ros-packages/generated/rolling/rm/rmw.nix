{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-ros-core,
  ament-cmake-version,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcutils,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw";
  version = "7.9.1-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ament-cmake-version ];
  propagatedNativeBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  buildInputs = [ ament-cmake ament-cmake-ros-core ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "34d305bcc165ba37658775b0c726415f0c8978e9";
        hash = "sha256-ScAzdraDuRlO41vLRNYej+uit1CPVJLfSNtD3b2Sc7o=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
