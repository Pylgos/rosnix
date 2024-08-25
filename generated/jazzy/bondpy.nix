{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  bond,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  smclib,
  substituteSource,
}:
let
  sources = rec {
    bondpy = substituteSource {
      src = fetchgit {
        name = "bondpy-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "7c82a2866dd3a0416dd370b7163b3384ae48635b";
        hash = "sha256-qBFpCzvtA7/Vghb+QkbCL8TBZoc5Kdhp+q876UZqVhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bondpy";
  version = "4.1.0-1";
  src = sources.bondpy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond rclpy smclib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python implementation of bond, a mechanism for checking when another process has terminated.";
  };
}
