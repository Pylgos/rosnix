{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_yaml,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_kernel = substituteSource {
      src = fetchgit {
        name = "mola_kernel-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "bc230e94509bba09e9642531d0dad3388b07e7dd";
        hash = "sha256-vfNlBXImZ9baT+0S2XzBIU+s79NQcDJr+0Hu696SQ1k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_kernel";
  version = "1.1.0-1";
  src = sources.mola_kernel;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_yaml mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
}
