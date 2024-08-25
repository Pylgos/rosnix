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
    mola_input_paris_luco_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_paris_luco_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "26f0eb72e3b1327ab3944b68ebb6a007fbba9c69";
        hash = "sha256-zdnVw+H4s/uqAh6j+SOiiPmqQaJjYGt3HIDg0ber4dI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_paris_luco_dataset";
  version = "1.1.0-1";
  src = sources.mola_input_paris_luco_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from Paris LUCO (CT-ICP) odometry/SLAM datasets";
  };
}
