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
let
  sources = mkSourceSet (sources: {
    "ros_gz" = substituteSource {
      src = fetchgit {
        name = "ros_gz-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "ab74f92cdb4c9db547ae46099e114210402dc1a6";
        hash = "sha256-f5AnBfCfnBIHVqAZA0mShO7a3mhUCc/Xh7I1aPZ9YdM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."ros_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros-gz-bridge ros-gz-image ros-gz-sim ros-gz-sim-demos ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with";
  };
})
