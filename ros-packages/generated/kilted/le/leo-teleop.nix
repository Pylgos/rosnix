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
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."leo_teleop";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joy-linux teleop-twist-joy teleop-twist-keyboard ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy-linux teleop-twist-joy teleop-twist-keyboard ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_teleop" = substituteSource {
      src = fetchgit {
        name = "leo_teleop-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "b3010445dd898a5eb3445a11c3cfc4bc369428c7";
        hash = "sha256-8fzxP2fH2U3v9gYQ7XNByVw1EbMUlFMUamX5k8+rRjE=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for Leo Rover teleoperation\n  ";
  };
})
