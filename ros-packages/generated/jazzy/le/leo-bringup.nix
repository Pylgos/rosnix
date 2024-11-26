{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-proc,
  leo-description,
  leo-fw,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rosapi,
  rosbridge-server,
  sensor-msgs,
  substituteSource,
  v4l2-camera,
  web-video-server,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_bringup";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."leo_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs image-proc leo-description leo-fw robot-state-publisher rosapi rosbridge-server sensor-msgs v4l2-camera web-video-server xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_bringup" = substituteSource {
      src = fetchgit {
        name = "leo_bringup-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "dcabada46de79dae25be46b27df6ae594b6f5c4d";
        hash = "sha256-Pp0BruzgYVR5nyNKJK2i/Ph82b//ClKffDGgZoS5td0=";
      };
    };
  });
  meta = {
    description = "Scripts and launch files for starting basic Leo Rover functionalities.";
  };
})
