{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_lola_sensor_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    nao_button_sim = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "2079860e6e50b930bf87f6000645ecabb9eb67d7";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nao_lola_sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Allows simulating button presses through command line interface";
  };
}
