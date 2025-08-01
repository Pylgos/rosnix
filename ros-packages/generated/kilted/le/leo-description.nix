{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_description";
  version = "3.1.0-2";
  src = finalAttrs.passthru.sources."leo_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_description" = substituteSource {
      src = fetchgit {
        name = "leo_description-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "95feff9449b4ae6ea486111080001e461fe0d0f7";
        hash = "sha256-mwjpo9x7R579Df50SdlZ/OimXHVyDX5TcftU2cMdnSY=";
      };
    };
  });
  meta = {
    description = "\n    URDF Description package for Leo Rover\n  ";
  };
})
