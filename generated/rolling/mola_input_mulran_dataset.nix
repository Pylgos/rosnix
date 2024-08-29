{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_kernel,
  mrpt_libmaps,
  mrpt_libposes,
  substituteSource,
}:
let
  sources = rec {
    mola_input_mulran_dataset = substituteSource {
      src = fetchgit {
        name = "mola_input_mulran_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "e1b3562536ab149ec7d238bb243f944e280eb300";
        hash = "sha256-lT1R9xtVYW9uKPf1OmQpLCq1YE82st2SWNAu3/thCu8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_mulran_dataset";
  version = "1.1.3-1";
  src = sources.mola_input_mulran_dataset;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_kernel mrpt_libmaps mrpt_libposes ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from MulRan datasets";
  };
}
