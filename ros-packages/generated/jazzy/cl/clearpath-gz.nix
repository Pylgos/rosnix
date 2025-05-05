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
  version = "2.3.1-1";
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
        rev = "34055c46f73ac7810bb7d9874e6e2d5c17db6e57";
        hash = "sha256-3Y9k/+S7HObVFYOyHTf/JWKTrnXESItU1R3b7WcqzGk=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Simulator";
  };
})
