{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  nav2-simple-commander,
  rosSystemPackages,
  slam-toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_navigation";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_navigation";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedBuildInputs = [ nav2-bringup nav2-simple-commander slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_navigation" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_navigation-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "74426a1eceddb92a218751b8986ea535400e8e21";
        hash = "sha256-eP0VlB/x4/bYG0FbQXDGsrcmzsEV0fcTf/mgpe2JmwA=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Navigation";
  };
})
