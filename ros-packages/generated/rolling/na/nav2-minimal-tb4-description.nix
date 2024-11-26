{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_minimal_tb4_description";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."nav2_minimal_tb4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "nav2_minimal_tb4_description" = substituteSource {
        src = fetchgit {
          name = "nav2_minimal_tb4_description-source";
          url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
          rev = "d799d33ee1346defee3f1c815d5eb62102f6011e";
          hash = "sha256-r1KPRn5VOO/olYF6Mmv/bf6pcOMHjL89MxlPhLetbyI=";
        };
      };
    });
  };
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
})
