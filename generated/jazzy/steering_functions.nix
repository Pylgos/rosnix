{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    steering_functions = substituteSource {
      src = fetchgit {
        name = "steering_functions-source";
        url = "https://github.com/ros2-gbp/steering_functions-release.git";
        rev = "6bc9fd51c83a1040d0e1a7f66aca7dfa3a716611";
        hash = "sha256-pU2fKTdPvxp9CHgQpy478rFkO/GvfwD54b2lnQlOAcE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "steering_functions";
  version = "0.3.0-1";
  src = sources.steering_functions;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ eigen ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The steering_functions package";
  };
}
