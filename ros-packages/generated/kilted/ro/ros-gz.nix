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
  version = "2.1.12-1";
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
        rev = "2a1e8ce94f51bb954db1c7b94fa0eff370432fcf";
        hash = "sha256-Zqlbwa9eEAqycMHf9V/O56pIAeNrAjQ4ojKQVC6Pv6A=";
      };
    };
  });
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with ";
  };
})
