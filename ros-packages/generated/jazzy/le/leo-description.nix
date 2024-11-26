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
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."leo_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru = {
    sources = mkSourceSet (sources: {
      "leo_description" = substituteSource {
        src = fetchgit {
          name = "leo_description-source";
          url = "https://github.com/ros2-gbp/leo_common-release.git";
          rev = "c8b7eb7ab155bfa8ffa686bd6fc14823756346cd";
          hash = "sha256-m+hHyJ2th4LpHdo+UpwCUwPPDsHwUynBcC9sLCdJZCc=";
        };
      };
    });
  };
  meta = {
    description = "URDF Description package for Leo Rover";
  };
})
