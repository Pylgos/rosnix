{
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    generate_parameter_library_py-96e638716be38fa957ab8646224c4b643b1d2b1b = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_py-96e638716be38fa957ab8646224c4b643b1d2b1b-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "96e638716be38fa957ab8646224c4b643b1d2b1b";
        hash = "sha256-YBWzYIIwR1Lla1+nuymfR73est+/pRbnkswPjPA5iOM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_library_py";
  version = "0.3.8-4";
  src = sources.generate_parameter_library_py-96e638716be38fa957ab8646224c4b643b1d2b1b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python to generate ROS parameter library.";
  };
}
