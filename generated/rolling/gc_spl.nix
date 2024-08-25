{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gc_spl_interfaces,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    gc_spl = substituteSource {
      src = fetchgit {
        name = "gc_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "7db7532c5833d2fd25edbad3bf25ebcf77a64a45";
        hash = "sha256-kZmdkalxnRdGGdrKhvxICSX3XNubLGW9lgzSf1zTjys=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl";
  version = "4.0.1-1";
  src = sources.gc_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gc_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "GameController-Robot communication in RoboCup SPL";
  };
}
