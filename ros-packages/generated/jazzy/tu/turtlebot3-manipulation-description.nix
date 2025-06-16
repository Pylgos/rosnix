{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_description";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui robot-state-publisher rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_description-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "a5bd57f4df04a31c5de270322b6ff41f8c1c0dc4";
        hash = "sha256-LtXHh22qX9ZyL2ff9X3lZLUH1pHsYt8ExDckfPJf//A=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 package for turtlebot3_manipulation_description\n  ";
  };
})
