{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    kitti_metrics_eval = substituteSource {
      src = fetchgit {
        name = "kitti_metrics_eval-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "63950770f7f1859ed69afcc75fb7fcec6bb4b99c";
        hash = "sha256-SUjOXUzVqrG0G3vP68x6HHclTcSl2xiMtC8E+nfhLXY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kitti_metrics_eval";
  version = "1.1.0-1";
  src = sources.kitti_metrics_eval;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "CLI tool to evaluate the KITTI odometry bechmark metrics to trajectory files";
  };
}
