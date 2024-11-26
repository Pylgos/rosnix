{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  domain-coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_ros";
  version = "0.13.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_ros";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest domain-coordinator ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest domain-coordinator ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_ros" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_ros-source";
          url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
          rev = "f29d91fdc8a7264e10f2bc2d686b2cfc566e6d3d";
          hash = "sha256-HkieJk0KOOUj88BIFRDA50HzlhPdzYZal3x+xWrVnMQ=";
        };
      };
    });
  };
  meta = {
    description = "The ROS specific CMake bits in the ament buildsystem.";
  };
})
