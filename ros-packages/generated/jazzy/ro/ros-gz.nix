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
  version = "1.0.14-1";
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
        rev = "e541f1bf5fff7514201577889187c038f8596af6";
        hash = "sha256-pg4mh5QMLGIhrrT0i9YkGH012SpkQOy5jAuymAtqk+I=";
      };
    };
  });
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with ";
  };
})
