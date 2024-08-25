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
        rev = "9fe78fa9ead21d853aa4236e31c8b2f252a370c4";
        hash = "sha256-SGXRECw8BNCknu/StKfvYKoVPdrcOOUqrQMLVD6BAmM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_py";
  version = "0.33.4-1";
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
