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
    mola_input_mulran_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b940080567e1bdfeae66934ed4e680672be224dc";
        hash = "sha256-/kMHfzyY0M8aigr6VNCi96hI6kRcwM2D8PgFkAne6QM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_mulran_dataset";
  version = "1.1.0-1";
  src = sources.mola_input_mulran_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
}
