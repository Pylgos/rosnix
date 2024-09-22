{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt_libmath,
  mrpt_libposes,
  mrpt_libtclap,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kitti_metrics_eval = substituteSource {
      src = fetchgit {
        name = "kitti_metrics_eval-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "29a9f75ff6c19b616b30244dd5d4bb13cb26547d";
        hash = "sha256-VSqzYNJIgz5CqK7xGpN+cc7LapBV9vuzflS0XSYPYQs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kitti_metrics_eval";
  version = "1.2.0-1";
  src = sources.kitti_metrics_eval;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mrpt_libmath mrpt_libposes mrpt_libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
}
