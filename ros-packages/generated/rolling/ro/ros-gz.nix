{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  ros-gz-sim-demos,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."ros_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ros-gz-bridge ros-gz-image ros-gz-sim ros-gz-sim-demos ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz" = substituteSource {
      src = fetchgit {
        name = "ros_gz-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "628f041e9389dcf57865d603c391e089cdbc5079";
        hash = "sha256-CGFHUEB6s73t2kwN2+rUE9ROEJr9/PwxB+eYAU2hF94=";
      };
    };
  });
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with";
  };
})
