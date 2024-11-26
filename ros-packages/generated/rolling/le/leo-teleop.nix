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
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."leo_teleop";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy-linux teleop-twist-joy teleop-twist-keyboard ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_teleop" = substituteSource {
      src = fetchgit {
        name = "leo_teleop-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "62b99f851ab3d7a86d2687981077d7fd3ca5eeb5";
        hash = "sha256-JeNimAF404UWrQOSZAjVQxl5ntBZtCKMBiq6oUssPTo=";
      };
    };
  });
  meta = {
    description = "Scripts and launch files for Leo Rover teleoperation";
  };
})
