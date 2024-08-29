{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libobs,
  substituteSource,
}:
let
  sources = rec {
    mola_input_rawlog = substituteSource {
      src = fetchgit {
        name = "mola_input_rawlog-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "041e4b9b00fbc97193f8dbd025852e754554a791";
        hash = "sha256-cyIWBTwSjlfA3DT2yU9S/5wys8egEb7A4KJrSwv1+n0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rawlog";
  version = "1.1.3-1";
  src = sources.mola_input_rawlog;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt_libobs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from MRPT rawlog datasets";
  };
}
