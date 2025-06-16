{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  navigation2,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_navigation2";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_navigation2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ navigation2 rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ navigation2 rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_navigation2" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_navigation2-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "2391730325dfe6c7f6ce0104314277e1380f20c8";
        hash = "sha256-5gdjIU+RzsFYrYMcBls5U+EN5yLoW7xsKKZIm67PlqU=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for navigation2\n  ";
  };
})
