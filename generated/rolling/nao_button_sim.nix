{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_lola_sensor_msgs,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    nao_button_sim = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "d32424bf386f95cffd3cd5ee49157a9922feef0f";
        hash = "sha256-IV6xrXwb9dZjmwilXG0QxfVUpofGVKBxJdaqAVjcCO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_button_sim";
  version = "1.0.1-1";
  src = sources.nao_button_sim;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_lola_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Allows simulating button presses through command line interface";
  };
}
