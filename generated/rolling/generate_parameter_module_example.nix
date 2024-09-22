{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  generate_parameter_library_py,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    generate_parameter_module_example = substituteSource {
      src = fetchFromGitHub {
        name = "generate_parameter_module_example-source";
        owner = "ros2-gbp";
        repo = "generate_parameter_library-release";
        rev = "9cc2325f63634db9965e347430e91d30465bbc82";
        hash = "sha256-HkXslneaMtWnT7O2G7ZfzPxK8AtAzT0SzjoJ5rVxha0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_module_example";
  version = "0.3.8-3";
  src = sources.generate_parameter_module_example;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ generate_parameter_library_py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Example usage of generate_parameter_library for a python module";
  };
}
