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
  version = "2.7.1-1";
  src = finalAttrs.passthru.sources."clearpath_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-common clearpath-generator-gz clearpath-viz gz-ros2-control ros-gz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-common clearpath-generator-gz clearpath-viz gz-ros2-control ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_gz" = substituteSource {
      src = fetchgit {
        name = "clearpath_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "b988761d2678c1bfdb732856a4ee2ac83f4e8fd0";
        hash = "sha256-0Muhef0cZ0KSU3ZiaScM8VFOFYkEFgaPyhUT/qhhDIo=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Simulator";
  };
})
