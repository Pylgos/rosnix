{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cli = substituteSource {
      src = fetchgit {
        name = "rosidl_cli-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "9221c1ad87215e3f88c227b5903f21be9b79718b";
        hash = "sha256-HE0sUa9zqCr5vhV5Cs3G51DYIdYJG34ce11BoNAFJaw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cli";
  version = "4.6.3-1";
  src = sources.rosidl_cli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.argcomplete python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Command line tools for ROS interface generation.";
  };
}
