{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    rtabmap_python = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "de46ffbf511fc67a7d4ed7d3138f3b371ad6ca33";
        hash = "sha256-BAkiOWJxqmytuyxSALt33GudRjNjfpI3j3J7DPMDkGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_python";
  version = "0.21.5-3";
  src = sources.rtabmap_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "RTAB-Map's python package.";
  };
}
