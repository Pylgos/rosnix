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
  version = "1.9.1-1";
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
        rev = "8df562ca282fba6dbee18998e503b17014dd4926";
        hash = "sha256-b2Dq7HvU015oyC9xPF3di+nddBAClDsububeE4EhkIc=";
      };
    };
  });
  meta = {
    description = "Metapackage with all core open-sourced MOLA packages.";
  };
})
