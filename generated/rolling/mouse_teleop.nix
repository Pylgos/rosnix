{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
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
        rev = "8762560d3376ef4d0acd8fa9b9d074e6857257e4";
        hash = "sha256-4ApQu9cIv086UTOdot+fSpAb8OEJT8gTERQwK2OWWL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mouse_teleop";
  version = "1.5.0-2";
  src = sources.mouse_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.numpy python3Packages.tkinter rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ];
  missingDependencies = [  ];
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
}
