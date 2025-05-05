{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-proc,
  launch,
  launch-ros,
  leo-description,
  leo-filters,
  leo-fw,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rosapi,
  rosbridge-server,
  sensor-msgs,
  substituteSource,
  web-video-server,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_bringup";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."leo_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs image-proc launch launch-ros leo-description leo-filters leo-fw robot-state-publisher rosapi rosbridge-server sensor-msgs web-video-server xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs image-proc launch launch-ros leo-description leo-filters leo-fw robot-state-publisher rosapi rosbridge-server sensor-msgs web-video-server xacro ];
  checkInputs = [ ament-cmake-black ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_bringup" = substituteSource {
      src = fetchgit {
        name = "leo_bringup-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "2112bfdc5c75b7a7cb377fb9a78148186bb29d62";
        hash = "sha256-z9EaaU0QrpP7qG6gup/CK2d/Oc9DHrI/LnhpyS0OEPc=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for starting basic Leo Rover functionalities. \n  ";
  };
})
