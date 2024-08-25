{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_input_rawlog = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "5b2e5ad5085cc631dbd5a9c2747dca0721c4e7e9";
        hash = "sha256-62AhKkNxE4UEDdUiv3mWtaxxwgZB0V71iIfmFVGo9z0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rawlog";
  version = "1.1.0-1";
  src = sources.mola_input_rawlog;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
}
