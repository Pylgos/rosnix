{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  joint-state-publisher,
  joint-state-publisher-gui,
  launch,
  mkSourceSet,
  realsense2-description,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_description";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-ros2-control joint-state-publisher joint-state-publisher-gui launch realsense2-description robot-state-publisher rviz2 urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_description" = substituteSource {
      src = fetchgit {
        name = "raspimouse_description-source";
        url = "https://github.com/ros2-gbp/raspimouse_description-release.git";
        rev = "9ca25d4da6850b7cae6ed7bd3c7968c32ecbc8d4";
        hash = "sha256-sS6ZTi0Ro+ZrymlycPdf+P42m+oGzUbsLBpvVfbHGv4=";
      };
    };
  });
  meta = {
    description = "The raspimouse_description package";
  };
})
