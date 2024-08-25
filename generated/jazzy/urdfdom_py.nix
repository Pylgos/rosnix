{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    urdfdom_py = substituteSource {
      src = fetchgit {
        name = "urdfdom_py-source";
        url = "https://github.com/ros2-gbp/urdfdom_py-release.git";
        rev = "691b53d7cea6d00fed623d8273f8914d94de760c";
        hash = "sha256-XIQzb/e4G8nvo/oqr/BKyEWW1LAFi2kvQhIdXhJHG+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom_py";
  version = "1.2.1-3";
  src = sources.urdfdom_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.lxml rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Python implementation of the URDF parser.";
  };
}
