{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_kernel,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_input_kitti_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "402a1b6e82da1ddcb61af53a85c1d4f6e191f1be";
        hash = "sha256-qEgQ/yXlCFYk9Fnsc6o33nmy/hi7Ac7OP5q+cQr2+wM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_kitti_dataset";
  version = "1.1.0-1";
  src = sources.mola_input_kitti_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
}
