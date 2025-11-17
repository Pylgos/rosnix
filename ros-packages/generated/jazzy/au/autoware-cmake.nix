{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_cmake";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."autoware_cmake";
  propagatedNativeBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  propagatedBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_cmake" = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "2173d91c8a5377c624263615e8f94bfcc127b04b";
        hash = "sha256-0wjbILDBcmV4Ir2Dd8nIS7/VFD8ubTUoF314Fm68jOY=";
      };
    };
  });
  meta = {
    description = "CMake scripts for Autoware";
  };
})
