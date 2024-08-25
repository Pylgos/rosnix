{
  action_tutorials_interfaces,
  ament_copyright,
  ament_flake8,
  ament_pep257,
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
    action_tutorials_py = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
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
  src = sources.action_tutorials_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_interfaces rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python action tutorial code";
  };
}
