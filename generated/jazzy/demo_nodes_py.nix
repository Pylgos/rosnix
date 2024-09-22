{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    demo_nodes_py = substituteSource {
      src = fetchFromGitHub {
        name = "demo_nodes_py-source";
        owner = "ros2-gbp";
        repo = "demos-release";
        rev = "e02223d3cfeaf484b6e77330e9b8fa8c11019711";
        hash = "sha256-ZFRDF1S8p79hUHhlRBNwfTL6QrWKANxIqNQt0HFQ2H8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "demo_nodes_py";
  version = "0.33.5-1";
  src = sources.demo_nodes_py;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python example_interfaces rcl_interfaces rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes.";
  };
}
