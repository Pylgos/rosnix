{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  python3Packages,
  rclpy,
  substituteSource,
  tf2_ros,
  tf_transformations,
}:
let
  sources = rec {
    nav2_loopback_sim = substituteSource {
      src = fetchgit {
        name = "nav2_loopback_sim-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "0c1736afb9ce7684200dee034620c05da7a3ede9";
        hash = "sha256-JsQnEvE47ybiHdLPwyBF8N6oH36t/gUgyypgOtDezVI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_loopback_sim";
  version = "1.3.2-1";
  src = sources.nav2_loopback_sim;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclpy tf2_ros tf_transformations ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [ "python3-transforms3d" ];
  meta = {
    description = "A loopback simulator to replace physics simulation";
  };
}
