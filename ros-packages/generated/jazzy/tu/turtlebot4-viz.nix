{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-robot-monitor,
  rviz2,
  substituteSource,
  turtlebot4-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_viz";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-robot-monitor rviz2 turtlebot4-description ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot4_viz" = substituteSource {
        src = fetchgit {
          name = "turtlebot4_viz-source";
          url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
          rev = "3c98949db94bbc3bd79210b1ff0d34845105f51d";
          hash = "sha256-2MtFFww8BkKfo7uBYUobASOrm84SlmO1+cfjaghHGVs=";
        };
      };
    });
  };
  meta = {
    description = "Visualization launchers and helpers for Turtlebot4";
  };
})
