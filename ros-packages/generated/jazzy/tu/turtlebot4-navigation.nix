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
  version = "2.1.0-1";
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
        rev = "923b9b61a3e2023fff799c058ad7a2beaccb4c39";
        hash = "sha256-fKYnFuTb6guDKlSTqx6Ogf8akO2tH1CgrWOdcN59oHA=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Navigation";
  };
})
