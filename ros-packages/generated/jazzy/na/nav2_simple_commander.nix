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
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    nav2_simple_commander-4a1746775eda82582b36284167b4614465541c70 = substituteSource {
      src = fetchgit {
        name = "nav2_simple_commander-4a1746775eda82582b36284167b4614465541c70-source";
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
  src = sources.nav2_simple_commander-4a1746775eda82582b36284167b4614465541c70;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs geometry_msgs lifecycle_msgs nav2_msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "An importable library for writing mobile robot applications in python3";
  };
}
