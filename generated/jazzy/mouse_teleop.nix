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
        rev = "c4340fc498afb1b2a88f351619cddb1817e9b256";
        hash = "sha256-4ApQu9cIv086UTOdot+fSpAb8OEJT8gTERQwK2OWWL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mouse_teleop";
  version = "1.5.0-3";
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
