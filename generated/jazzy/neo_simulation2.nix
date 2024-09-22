{
  ament_cmake,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    neo_simulation2 = substituteSource {
      src = fetchFromGitHub {
        name = "neo_simulation2-source";
        owner = "ros2-gbp";
        repo = "neo_simulation2-release";
        rev = "c13b97f6ffbb4750704ec1811473e7b2a6489e57";
        hash = "sha256-RDPwVwW9QTfOVM8jYVgKbR+YmGDSXRq1Wz5minbCbD8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "neo_simulation2";
  version = "1.0.0-5";
  src = sources.neo_simulation2;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "ROS-2 Simulation packages for neobotix robots";
  };
}
