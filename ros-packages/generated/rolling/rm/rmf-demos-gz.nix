{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-xml,
  mkSourceSet,
  rmf-building-sim-gz-plugins,
  rmf-demos,
  rmf-robot-sim-gz-plugins,
  ros-gz-bridge,
  ros-gz-sim,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  teleop-twist-keyboard,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_demos_gz";
  version = "2.8.2-1";
  src = finalAttrs.passthru.sources."rmf_demos_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-xml rmf-building-sim-gz-plugins rmf-demos rmf-robot-sim-gz-plugins ros2launch ros-gz-bridge ros-gz-sim teleop-twist-keyboard ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml rmf-building-sim-gz-plugins rmf-demos rmf-robot-sim-gz-plugins ros2launch ros-gz-bridge ros-gz-sim teleop-twist-keyboard ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_gz" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_gz-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "06e0b0d9842e9e1bf6540f5098df547f79874b97";
        hash = "sha256-MOET88g76YGZ3Yg6ICYRFZkZvUZhBq7w5dM4YnPH6bc=";
      };
    };
  });
  meta = {
    description = "Launch files for RMF demos using the Gazebo simulator";
  };
})
