{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libmath,
  mrpt-libposes,
  mrpt-libtclap,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "kitti_metrics_eval" = substituteSource {
      src = fetchgit {
        name = "kitti_metrics_eval-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "533ea9a8ecabbb5360c91a29ce0a8d124e6e2a02";
        hash = "sha256-VSqzYNJIgz5CqK7xGpN+cc7LapBV9vuzflS0XSYPYQs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kitti_metrics_eval";
  version = "1.2.0-1";
  src = sources."kitti_metrics_eval";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmath mrpt-libposes mrpt-libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
}
