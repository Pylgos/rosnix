{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildRosPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "demo_nodes_py" = substituteSource {
      src = fetchgit {
        name = "demo_nodes_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e02223d3cfeaf484b6e77330e9b8fa8c11019711";
        hash = "sha256-ZFRDF1S8p79hUHhlRBNwfTL6QrWKANxIqNQt0HFQ2H8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "demo_nodes_py";
  version = "0.33.5-1";
  src = sources."demo_nodes_py";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python example-interfaces rcl-interfaces rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes.";
  };
}
