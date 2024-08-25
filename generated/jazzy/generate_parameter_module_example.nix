{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  generate_parameter_library_py,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    generate_parameter_module_example = substituteSource {
      src = fetchgit {
        name = "generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "0bf2b4606ea98146fa03404cf91e490ae37666ee";
        hash = "sha256-HkXslneaMtWnT7O2G7ZfzPxK8AtAzT0SzjoJ5rVxha0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_module_example";
  version = "0.3.8-4";
  src = sources.generate_parameter_module_example;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ generate_parameter_library_py ];
  buildInputs = [  ];
  propagatedBuildInputs = [ generate_parameter_library rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Example usage of generate_parameter_library for a python module";
  };
}
