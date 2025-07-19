{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-move-group,
  nav2-bringup,
  nav2-bt-navigator,
  rosSystemPackages,
  substituteSource,
  turtlebot3-manipulation-bringup,
  turtlebot3-manipulation-moveit-config,
  turtlebot3-manipulation-navigation2,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_home_service_challenge_tools";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot3_home_service_challenge_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager moveit-ros-move-group nav2-bringup nav2-bt-navigator turtlebot3-manipulation-bringup turtlebot3-manipulation-moveit-config turtlebot3-manipulation-navigation2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager moveit-ros-move-group nav2-bringup nav2-bt-navigator turtlebot3-manipulation-bringup turtlebot3-manipulation-moveit-config turtlebot3-manipulation-navigation2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_home_service_challenge_tools" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_home_service_challenge_tools-source";
        url = "https://github.com/ros2-gbp/turtlebot3_home_service_challenge-release.git";
        rev = "5b271f4e4f9c910ea79fae6e9213982b7f77e900";
        hash = "sha256-q3ZshYam8eQ1QBVYoFN9SMY5TEb57fS01y1QL6zUnxg=";
      };
    };
  });
  meta = {
    description = "\n    turtlebot3_home_service_challenge_tools\n  ";
  };
})
