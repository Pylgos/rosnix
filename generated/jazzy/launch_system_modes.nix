{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  osrf_pycommon,
  python3Packages,
  rclpy,
  substituteSource,
  system_modes_msgs,
}:
let
  sources = rec {
    launch_system_modes = substituteSource {
      src = fetchgit {
        name = "launch_system_modes-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "a08a9c8c80eee8713a7f490c95cd4db75d3f1805";
        hash = "sha256-igv7EQutLOf+qcExGB554hDDTuFxB1P9COvQUY2izGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_system_modes";
  version = "0.9.0-6";
  src = sources.launch_system_modes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch osrf_pycommon rclpy system_modes_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "System modes specific extensions to the launch tool, i.e. launch actions, events, and event handlers for system modes.";
  };
}
