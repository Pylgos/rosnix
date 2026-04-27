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
  version = "2.9.1-1";
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
        rev = "e0f895c0f4fc4fbe742d3585cf326b24efc67813";
        hash = "sha256-wpVgRQTqciOS60X3kj0YAXMF7I8ou0aWxj+jCsjUyDU=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Simulator";
  };
})
