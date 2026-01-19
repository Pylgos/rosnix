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
  leo-msgs,
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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."leo_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs image-proc launch launch-ros leo-description leo-filters leo-fw leo-msgs robot-state-publisher rosapi rosbridge-server sensor-msgs web-video-server xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-smbus2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs image-proc launch launch-ros leo-description leo-filters leo-fw leo-msgs robot-state-publisher rosapi rosbridge-server sensor-msgs web-video-server xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-smbus2" ]; };
  checkInputs = [ ament-cmake-black ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_bringup" = substituteSource {
      src = fetchgit {
        name = "leo_bringup-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "d191aa076528fdb904821b0d80a27990491b5b56";
        hash = "sha256-FoZoDrNUyfFUWFRL2hcvczV43tmzbeStqRRjpIizLik=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for starting basic Leo Rover functionalities. \n  ";
  };
})
