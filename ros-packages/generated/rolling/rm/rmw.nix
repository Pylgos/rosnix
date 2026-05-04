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
  version = "7.10.1-4";
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
        rev = "c567a8d42cdf148256e0570d0cc13c4ac69bcad5";
        hash = "sha256-4Rj2/5EpXK8fHS6701KBHNHJ2q9wsPCL5CgTQgynBT4=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
