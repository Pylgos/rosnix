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
    ament_index_python-09677a90ba9ab5d88e5e88d54bd634babe291111 = substituteSource {
      src = fetchgit {
        name = "ament_index_python-09677a90ba9ab5d88e5e88d54bd634babe291111-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "09677a90ba9ab5d88e5e88d54bd634babe291111";
        hash = "sha256-pFE0zkyQVZyuCt6dZF7WVAosP4unngBqEtuNGDXAaaM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_index_python";
  version = "1.9.0-1";
  src = sources.ament_index_python-09677a90ba9ab5d88e5e88d54bd634babe291111;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python API to access the ament resource index.";
  };
}
