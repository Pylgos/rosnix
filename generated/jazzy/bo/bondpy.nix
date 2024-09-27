{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  bond,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  smclib,
  substituteSource,
}:
let
  sources = rec {
    bondpy-7c82a2866dd3a0416dd370b7163b3384ae48635b = substituteSource {
      src = fetchgit {
        name = "bondpy-7c82a2866dd3a0416dd370b7163b3384ae48635b-source";
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
  src = sources.bondpy-7c82a2866dd3a0416dd370b7163b3384ae48635b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bond rclpy smclib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python implementation of bond, a mechanism for checking when another process has terminated.";
  };
}
