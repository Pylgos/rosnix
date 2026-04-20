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
  pname = "raph_description";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."raph_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_description" = substituteSource {
      src = fetchgit {
        name = "raph_description-source";
        url = "https://github.com/ros2-gbp/raph_common-release.git";
        rev = "95da7b52afc417e274792fbd5536aaaffe2f9eda";
        hash = "sha256-/D2JJ0gBX5JHhUfkvEUFW69ENmw+2loSWSwjxHv9rNo=";
      };
    };
  });
  meta = {
    description = "\n    URDF Description package for Raph Rover\n  ";
  };
})
