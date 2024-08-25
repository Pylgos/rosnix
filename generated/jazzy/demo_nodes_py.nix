{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_py = substituteSource {
      src = fetchgit {
        name = "demo_nodes_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "4c25959b5066daab3e037533b7dfc380dda62a25";
        hash = "sha256-+2ZZpQnOChaRARja3aOfvZjGKyzbKjSDB1OasCrEWyo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_py";
  version = "0.33.4-1";
  src = sources.demo_nodes_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python example_interfaces rcl_interfaces rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes.";
  };
}
