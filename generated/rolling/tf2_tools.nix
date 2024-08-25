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
        rev = "aef821033946b1d2c3b0adda75b07e2a358a2909";
        hash = "sha256-Ol4zYsUAmSY3Vc7eCx9VcCyKSi+hiOC/FOTFijHZQ2k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_tools";
  version = "0.38.2-1";
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
