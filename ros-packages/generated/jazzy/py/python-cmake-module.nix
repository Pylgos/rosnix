{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "python_cmake_module" = substituteSource {
      src = fetchgit {
        name = "python_cmake_module-source";
        url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
        rev = "52f6dbc990f7a89ceb09ab0cc394cc7214138f62";
        hash = "sha256-Klye1NN6+5ap5R+UqUk2oAwG5lScU4OPpYX+nALlnno=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "python_cmake_module";
  version = "0.11.1-2";
  src = sources."python_cmake_module";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provide CMake module with extra functionality for Python.";
  };
}
