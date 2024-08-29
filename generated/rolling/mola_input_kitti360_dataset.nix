{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_kernel,
  mrpt_libmaps,
  substituteSource,
}:
let
  sources = rec {
    mola_input_kitti360_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti360_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "7c7de6bacad27372fd0f38c15616c42c2f114421";
        hash = "sha256-Y20kIaOVUej6M0WiMzDkmgslUVRoBI/e+bUmJXlKNZ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_kitti360_dataset";
  version = "1.1.3-1";
  src = sources.mola_input_kitti360_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt_libmaps ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from Kitti-360 datasets";
  };
}
