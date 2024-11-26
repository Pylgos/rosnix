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
  version = "7.5.0-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-dynamic-typesupport rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmw" = substituteSource {
        src = fetchgit {
          name = "rmw-source";
          url = "https://github.com/ros2-gbp/rmw-release.git";
          rev = "26c3988106253055a5ab299ac8a86532c1ccef17";
          hash = "sha256-LWo7vL8C0tqposyiosxLmiRZXcHfSvlsQk+6X/wGfow=";
        };
      };
    });
  };
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
