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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."leo_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_description" = substituteSource {
      src = fetchgit {
        name = "leo_description-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "582004bbd1b126027a89ac935ffbe94a012d1a1e";
        hash = "sha256-mwjpo9x7R579Df50SdlZ/OimXHVyDX5TcftU2cMdnSY=";
      };
    };
  });
  meta = {
    description = "URDF Description package for Leo Rover";
  };
})
