{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  tf2,
  vrpn,
}:
let
  sources = rec {
    vrpn_mocap = substituteSource {
      src = fetchFromGitHub {
        name = "vrpn_mocap-source";
        owner = "ros2-gbp";
        repo = "vrpn_mocap-release";
        rev = "ff6e0e030ec5415d376d4e42d65f759e5454bdaf";
        hash = "sha256-qTdwB+YAkx59icepyKJgOykWlxF7kMMSSJ/EKm+NVWs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vrpn_mocap";
  version = "1.1.0-3";
  src = sources.vrpn_mocap;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp std_msgs tf2 vrpn ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2";
  };
}
