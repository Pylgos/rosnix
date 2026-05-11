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
  version = "0.16.0-1";
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
        rev = "8752f88e10e342c1f7d2c3c8734102269d13de05";
        hash = "sha256-A2rVMH7TWQQR2Gpb8Ls44b821E9Kej+zh3lt1y3Dr+s=";
      };
    };
  });
  meta = {
    description = "Core ROS specific CMake bits in the ament buildsystem.";
  };
})
