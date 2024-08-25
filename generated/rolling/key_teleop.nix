{
  ament_copyright,
  ament_flake8,
  ament_pep257,
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
    key_teleop = substituteSource {
      src = fetchgit {
        name = "key_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "e49fc60ac28521a2987d71a27967476c5e5127c9";
        hash = "sha256-P0O7MXzaLKeuYvu6YMXX96VVA/7xslaPVosdEfWAtMU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "key_teleop";
  version = "1.5.0-2";
  src = sources.key_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A text-based interface to send a robot movement commands.";
  };
}
