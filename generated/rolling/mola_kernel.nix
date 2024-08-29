{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_yaml,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libobs,
  substituteSource,
}:
let
  sources = rec {
    mola_kernel = substituteSource {
      src = fetchgit {
        name = "mola_kernel-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "9be92a1a65a1a565e96962ba4b3719549f0854cb";
        hash = "sha256-z5tffpQSswwgQQGXTrjT1AAm3LMuXpD99TqUceYoEw8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_kernel";
  version = "1.1.3-1";
  src = sources.mola_kernel;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_yaml mrpt_libgui mrpt_libmaps mrpt_libobs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
}
