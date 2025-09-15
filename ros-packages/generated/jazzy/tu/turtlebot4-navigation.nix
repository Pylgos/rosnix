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
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_navigation";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-bringup nav2-simple-commander slam-toolbox ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ nav2-bringup nav2-simple-commander slam-toolbox ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_navigation" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_navigation-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "3c7bdfc8d23587735141f287ba295584c96dc56b";
        hash = "sha256-+QxSoPBYIE3bRloRrRhN2bXGHKQHo+TrWC8Eeo22nhk=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Navigation";
  };
})
