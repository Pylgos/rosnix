{
  ament-copyright,
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
    "generate_parameter_library_py" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_py-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "2daa59544a87b3efa82707b77b996214e43fe259";
        hash = "sha256-YBWzYIIwR1Lla1+nuymfR73est+/pRbnkswPjPA5iOM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "generate_parameter_library_py";
  version = "0.3.8-3";
  src = sources."generate_parameter_library_py";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-jinja2" "python3-typeguard" "python3-yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python to generate ROS parameter library.";
  };
}
