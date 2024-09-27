{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rtabmap_python-de46ffbf511fc67a7d4ed7d3138f3b371ad6ca33 = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-de46ffbf511fc67a7d4ed7d3138f3b371ad6ca33-source";
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
  src = sources.rtabmap_python-de46ffbf511fc67a7d4ed7d3138f3b371ad6ca33;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "RTAB-Map's python package.";
  };
}
