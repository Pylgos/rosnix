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
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  tf_transformations,
}:
let
  sources = rec {
    nav2_loopback_sim-0c1736afb9ce7684200dee034620c05da7a3ede9 = substituteSource {
      src = fetchgit {
        name = "nav2_loopback_sim-0c1736afb9ce7684200dee034620c05da7a3ede9-source";
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
  src = sources.nav2_loopback_sim-0c1736afb9ce7684200dee034620c05da7a3ede9;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclpy tf2_ros tf_transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-transforms3d" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A loopback simulator to replace physics simulation";
  };
}
