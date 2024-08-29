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
    mola_input_kitti_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "959f87c131e13313b81bd883951dbe98d4061429";
        hash = "sha256-vjak2IZCvzXRsejYmChKejd/AaKkLgsICq6VvyHvjxU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_kitti_dataset";
  version = "1.1.3-1";
  src = sources.mola_input_kitti_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt_libmaps ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from Kitti odometry/SLAM datasets";
  };
}
