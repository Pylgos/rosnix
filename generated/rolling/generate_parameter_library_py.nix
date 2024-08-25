{
  ament_copyright,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    generate_parameter_library_py = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_py-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "2daa59544a87b3efa82707b77b996214e43fe259";
        hash = "sha256-YBWzYIIwR1Lla1+nuymfR73est+/pRbnkswPjPA5iOM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_library_py";
  version = "0.3.8-3";
  src = sources.generate_parameter_library_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 python3Packages.jinja2 python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright python3Packages.pytest ];
  missingDependencies = [ "python3-typeguard" ];
  meta = {
    description = "Python to generate ROS parameter library.";
  };
}
