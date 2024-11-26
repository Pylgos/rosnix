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
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."leo_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_description" = substituteSource {
      src = fetchgit {
        name = "leo_description-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "fb10fa4cfb080e6967126b19ac1abc4c85aa85f0";
        hash = "sha256-Yi8hUp1UDui0Zdzwx6JhxHXBD4N3/L36/mN0dwOHufY=";
      };
    };
  });
  meta = {
    description = "URDF Description package for Leo Rover";
  };
})
