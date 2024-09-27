{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gc_spl_interfaces,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gc_spl" = substituteSource {
      src = fetchgit {
        name = "gc_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "348df86f0c57eea9c7b2f5f7d9f9dc381beb9efa";
        hash = "sha256-kZmdkalxnRdGGdrKhvxICSX3XNubLGW9lgzSf1zTjys=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gc_spl";
  version = "4.0.1-1";
  src = sources."gc_spl";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gc_spl_interfaces rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-construct" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
}
