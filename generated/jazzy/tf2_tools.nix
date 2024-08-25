{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  graphviz,
  python3Packages,
  rclpy,
  substituteSource,
  tf2_msgs,
  tf2_py,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_tools = substituteSource {
      src = fetchgit {
        name = "tf2_tools-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "985d79ecc02978c993c3db46f636a34a43475721";
        hash = "sha256-dHtVvaKNOt1mxXBgaHpNzOjkyZV7NnP1S+DEbqkPvLg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_tools";
  version = "0.36.4-1";
  src = sources.tf2_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphviz rclpy tf2_msgs tf2_py tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "tf2_tools";
  };
}
