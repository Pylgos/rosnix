{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kitti-metrics-eval,
  mkSourceSet,
  mola-bridge-ros2,
  mola-demos,
  mola-input-euroc-dataset,
  mola-input-kitti-dataset,
  mola-input-kitti360-dataset,
  mola-input-mulran-dataset,
  mola-input-paris-luco-dataset,
  mola-input-rawlog,
  mola-input-rosbag2,
  mola-input-video,
  mola-kernel,
  mola-launcher,
  mola-metric-maps,
  mola-pose-list,
  mola-relocalization,
  mola-traj-tools,
  mola-viz,
  mola-yaml,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."mola";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ kitti-metrics-eval mola-bridge-ros2 mola-demos mola-input-euroc-dataset mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-input-video mola-kernel mola-launcher mola-metric-maps mola-pose-list mola-relocalization mola-traj-tools mola-viz mola-yaml ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ kitti-metrics-eval mola-bridge-ros2 mola-demos mola-input-euroc-dataset mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-input-video mola-kernel mola-launcher mola-metric-maps mola-pose-list mola-relocalization mola-traj-tools mola-viz mola-yaml ];
  passthru.sources = mkSourceSet (sources: {
    "mola" = substituteSource {
      src = fetchgit {
        name = "mola-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "4b92dd2b135699b6201ae419b4e8b772d5273f5b";
        hash = "sha256-fBLYTP3Le7JB9zll+zrxPLLcS0iT5hpRDIboO3Qt080=";
      };
    };
  });
  meta = {
    description = "Metapackage with all core open-sourced MOLA packages.";
  };
})
