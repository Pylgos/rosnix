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
  version = "3.0.5-1";
  src = finalAttrs.passthru.sources."ros_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-gz-bridge ros-gz-image ros-gz-sim ros-gz-sim-demos ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-gz-bridge ros-gz-image ros-gz-sim ros-gz-sim-demos ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz" = substituteSource {
      src = fetchgit {
        name = "ros_gz-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "722e3def11a882d49d5817b5668f5149da66d8bf";
        hash = "sha256-a7CISLFfOZsxv0Woxbxo9VsoR8ixZKEfkSqgj3kdico=";
      };
    };
  });
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with ";
  };
})
