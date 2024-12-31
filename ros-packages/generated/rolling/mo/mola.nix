{
  ament-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "mola";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ kitti-metrics-eval mola-bridge-ros2 mola-demos mola-input-euroc-dataset mola-input-kitti360-dataset mola-input-kitti-dataset mola-input-mulran-dataset mola-input-paris-luco-dataset mola-input-rawlog mola-input-rosbag2 mola-kernel mola-launcher mola-metric-maps mola-pose-list mola-relocalization mola-traj-tools mola-viz mola-yaml ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola" = substituteSource {
      src = fetchgit {
        name = "mola-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "d6decad8dc33d86ed269be68221c07872b0cba56";
        hash = "sha256-VeunVmfMGp76USkzuFnRrN+m3O9SKqASP8qgnnFsEXE=";
      };
    };
  });
  meta = {
    description = "Metapackage with all core open-sourced MOLA packages.";
  };
})
