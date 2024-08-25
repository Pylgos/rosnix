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
        rev = "72b86114e5ca265990a17f1a1fba4dcceac9d388";
        hash = "sha256-ErrxjB7aVw1B7BTi7x6/mF08N4ylWUIzyt6fkId8BvI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_py";
  version = "0.34.2-1";
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
