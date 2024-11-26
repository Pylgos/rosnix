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
  version = "0.12.0-3";
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
          rev = "3e2e92d82c1ae9b9a284684ae48601bfa3ca32fe";
          hash = "sha256-tT6X6MXP8iTsdlyNk33jdPbZZT+sWXvuIn8cTnvTYyw=";
        };
      };
    });
  };
  meta = {
    description = "The ROS specific CMake bits in the ament buildsystem.";
  };
})
