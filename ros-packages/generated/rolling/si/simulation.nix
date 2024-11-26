{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-base,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-interfaces,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simulation";
  version = "0.12.0-1";
  src = finalAttrs.passthru.sources."simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ros-base ros-gz-bridge ros-gz-image ros-gz-interfaces ros-gz-sim ];
  passthru.sources = mkSourceSet (sources: {
    "simulation" = substituteSource {
      src = fetchgit {
        name = "simulation-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "1250b86e502207a660526b2486d0be164d190303";
        hash = "sha256-KS/aXv6kMfo/fvDYJQ15Nft8oENttFGM3IjW+CwNA00=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_base' and includes simulation packages.";
  };
})
