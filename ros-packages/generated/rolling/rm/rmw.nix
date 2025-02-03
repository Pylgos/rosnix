{
  ament-cmake-gmock,
  ament-cmake-ros,
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
  version = "7.6.0-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "97ffd3befca7fbbc1f138bb14b82ab2edc7d615c";
        hash = "sha256-pm5YOUXYUx9e27ubmWbczq4kN26x/2AUNEJqudatHaM=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
