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
    mola_input_kitti360_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti360_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "153f85850a101e11d193e78baa18f9b1f72fc82f";
        hash = "sha256-5FRbtcet0EJ7IDnKeYx/kBYEAtVY07IxJmAl7c/hMT0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_kitti360_dataset";
  version = "1.1.0-1";
  src = sources.mola_input_kitti360_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from Kitti-360 datasets";
  };
}
