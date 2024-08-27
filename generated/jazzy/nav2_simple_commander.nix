{
  action_msgs,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav2_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    nav2_simple_commander = substituteSource {
      src = fetchgit {
        name = "nav2_simple_commander-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4a1746775eda82582b36284167b4614465541c70";
        hash = "sha256-zYsPBi6Y9OHE1Sct61Zk905/ZbLsNw2526c2dtYtElk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_simple_commander";
  version = "1.3.2-1";
  src = sources.nav2_simple_commander;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs lifecycle_msgs nav2_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "An importable library for writing mobile robot applications in python3";
  };
}
