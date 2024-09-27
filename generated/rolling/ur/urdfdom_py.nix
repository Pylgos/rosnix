{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    urdfdom_py-63259c8319609c2dcd7e7fff99db12ce70f88a1a = substituteSource {
      src = fetchgit {
        name = "urdfdom_py-63259c8319609c2dcd7e7fff99db12ce70f88a1a-source";
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
  src = sources.urdfdom_py-63259c8319609c2dcd7e7fff99db12ce70f88a1a;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python implementation of the URDF parser.";
  };
}
