{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rtabmap-conversions,
  rtabmap-demos,
  rtabmap-examples,
  rtabmap-launch,
  rtabmap-msgs,
  rtabmap-odom,
  rtabmap-python,
  rtabmap-rviz-plugins,
  rtabmap-slam,
  rtabmap-sync,
  rtabmap-util,
  rtabmap-viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rtabmap_ros" = substituteSource {
      src = fetchgit {
        name = "rtabmap_ros-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "0657471e1353d3541447a2cc2b00271aaf695972";
        hash = "sha256-lfDi9FGpg8jfzKpZviZiOi54jP4uySFHVV8G+LS66U4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rtabmap_ros";
  version = "0.21.5-3";
  src = sources."rtabmap_ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rtabmap-conversions rtabmap-demos rtabmap-examples rtabmap-launch rtabmap-msgs rtabmap-odom rtabmap-python rtabmap-rviz-plugins rtabmap-slam rtabmap-sync rtabmap-util rtabmap-viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map Stack";
  };
}
