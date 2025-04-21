{
  ament-cmake-core,
  ament-cmake-export-dependencies,
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
  version = "0.14.3-1";
  src = finalAttrs.passthru.sources."ament_cmake_ros_core";
  nativeBuildInputs = [ ament-cmake-export-dependencies ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  buildInputs = [ ament-cmake-export-dependencies ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-libraries ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_ros_core" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_ros_core-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "47aa2f70719794af2c620972507c8931d14b5ffe";
        hash = "sha256-gzQG3yZC16rTu4rQ6cwPiXwx/bplnEzbnsswEPg6TCk=";
      };
    };
  });
  meta = {
    description = "Core ROS specific CMake bits in the ament buildsystem.";
  };
})
