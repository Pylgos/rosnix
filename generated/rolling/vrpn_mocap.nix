{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  std_msgs,
  substituteSource,
  tf2,
  vrpn,
}:
let
  sources = rec {
    vrpn_mocap = substituteSource {
      src = fetchgit {
        name = "vrpn_mocap-source";
        url = "https://github.com/ros2-gbp/vrpn_mocap-release.git";
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
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp std_msgs tf2 vrpn ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2";
  };
}
