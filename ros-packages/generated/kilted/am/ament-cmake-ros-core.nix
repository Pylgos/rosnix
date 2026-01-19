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
  version = "0.14.7-1";
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
        rev = "00ae6b67713254b96b3d7e06c659ef20fb57dbec";
        hash = "sha256-9AwCBq3tYzReYbzk6VtlrxCMF5aMkxBKpN90qFRv51M=";
      };
    };
  });
  meta = {
    description = "Core ROS specific CMake bits in the ament buildsystem.";
  };
})
