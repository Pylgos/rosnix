{
  ament-cmake-core,
  ament-cmake-export-dependencies,
  ament-cmake-export-targets,
  ament-cmake-libraries,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_ros_core";
  version = "0.15.7-1";
  src = finalAttrs.passthru.sources."ament_cmake_ros_core";
  nativeBuildInputs = [ ament-cmake-export-dependencies ament-cmake-export-targets ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  buildInputs = [ ament-cmake-export-dependencies ament-cmake-export-targets ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_ros_core" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_ros_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "8e7fc5261168a0daad45e3ea6bf9f15734ca80e7";
        hash = "sha256-2XCm2TzRpkHwqZ2o9CYznhp1T4nxGJiXPMlNGvvz6es=";
      };
    };
  });
  meta = {
    description = "Core ROS specific CMake bits in the ament buildsystem.";
  };
})
