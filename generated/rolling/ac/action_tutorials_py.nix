{
  action_tutorials_interfaces,
  ament_copyright,
  ament_flake8,
  ament_pep257,
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
    action_tutorials_py-15f85bf596bda0208cae4d105c9a6687772388e3 = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-15f85bf596bda0208cae4d105c9a6687772388e3-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "15f85bf596bda0208cae4d105c9a6687772388e3";
        hash = "sha256-QCJ+bVolzqaS/rLdXkmJ5m6BFU5WsXrnVXH2i9nYgIM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_py";
  version = "0.34.2-1";
  src = sources.action_tutorials_py-15f85bf596bda0208cae4d105c9a6687772388e3;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_tutorials_interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python action tutorial code";
  };
}
