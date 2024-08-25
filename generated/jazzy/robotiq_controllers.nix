{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    robotiq_controllers = substituteSource {
      src = fetchgit {
        name = "robotiq_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
        rev = "6c6fbff726bf1944fd9a5a51ed3ee60365f53e5f";
        hash = "sha256-JhCCmqa9agEkqVO3vJ372AV/ZDF6zTNZta6YYwe29Y8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotiq_controllers";
  version = "0.0.1-3";
  src = sources.robotiq_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Controllers for the Robotiq gripper.";
  };
}
