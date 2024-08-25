{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  substituteSource,
}:
let
  sources = rec {
    python_cmake_module = substituteSource {
      src = fetchgit {
        name = "python_cmake_module-source";
        url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
        rev = "52f6dbc990f7a89ceb09ab0cc394cc7214138f62";
        hash = "sha256-Klye1NN6+5ap5R+UqUk2oAwG5lScU4OPpYX+nALlnno=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_cmake_module";
  version = "0.11.1-2";
  src = sources.python_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
}
