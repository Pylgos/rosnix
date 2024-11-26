{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  teleop-twist-joy,
  teleop-twist-keyboard,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_teleop";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."leo_teleop";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy-linux teleop-twist-joy teleop-twist-keyboard ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_teleop" = substituteSource {
      src = fetchgit {
        name = "leo_teleop-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "3c0a674168ad40053c1147b328b885694c6a8fda";
        hash = "sha256-7LSrtldXhZrS28iRUeqnMX0ow1RCOW0DdAV4F0oYmM0=";
      };
    };
  });
  meta = {
    description = "Scripts and launch files for Leo Rover teleoperation";
  };
})
