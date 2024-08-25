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
        rev = "53b8898b7e5cfc687fa82dfb2f0d3e89d39340da";
        hash = "sha256-X30BhGckqwyC/VfTB6oQWmvIeO8tCq8D0gioJNc8EnM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cli";
  version = "4.8.1-1";
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
