{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    mouse_teleop = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "91d160af34687e043719ef2eea68a49278c7fda2";
        hash = "sha256-Zu3CcQYsLdjXYxZcH87gLEUAF1rL6+Rvl7mR6dHH/mA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mouse_teleop";
  version = "1.5.1-1";
  src = sources.mouse_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.tkinter rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ];
  missingDependencies = [  ];
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
}
