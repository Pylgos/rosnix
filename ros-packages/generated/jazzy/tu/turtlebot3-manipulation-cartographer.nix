{
  ament-cmake,
  buildAmentCmakePackage,
  cartographer-ros,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_manipulation_cartographer";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_manipulation_cartographer";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cartographer-ros rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cartographer-ros rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_manipulation_cartographer" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_cartographer-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "b3d3359b655b858fd140d0cb45ac629ee8f0543b";
        hash = "sha256-QO2skFKBWP167vxCGELGGzc6WRZGGvK+/A9zhZTndxQ=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for cartographer\n  ";
  };
})
