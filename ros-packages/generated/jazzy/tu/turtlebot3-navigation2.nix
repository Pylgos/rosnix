{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-bringup,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_navigation2";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ nav2-bringup ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-bringup ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_navigation2" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "3abcacdcf1b78bc33be8c07e288b8eab9683dc5c";
        hash = "sha256-C9gpl/nCncPeSbaTZGgjZze9jKnGjVASFsb0UUFQKT8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for navigation2\n  ";
  };
})
