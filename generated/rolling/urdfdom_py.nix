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
        rev = "63259c8319609c2dcd7e7fff99db12ce70f88a1a";
        hash = "sha256-XIQzb/e4G8nvo/oqr/BKyEWW1LAFi2kvQhIdXhJHG+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom_py";
  version = "1.2.1-2";
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
