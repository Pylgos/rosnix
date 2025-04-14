{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-common,
  clearpath-generator-gz,
  clearpath-viz,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  mkSourceSet,
  ros-gz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_gz";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."clearpath_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-common clearpath-generator-gz clearpath-viz gz-ros2-control ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_gz" = substituteSource {
      src = fetchgit {
        name = "clearpath_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "f6a6288ef356b9ce63f73c6517656c80007e4304";
        hash = "sha256-78f91K0Snfp/mgS7c1WiU5pxyTpTmUFVrDr0WnMlSSs=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Simulator";
  };
})
