{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    joy_tester = substituteSource {
      src = fetchgit {
        name = "joy_tester-source";
        url = "https://github.com/ros2-gbp/joy_tester-release.git";
        rev = "7287ff765bbd548f037e3d25bea88aeaca17a6f2";
        hash = "sha256-4aFhMjPuS3BCh6fHb0WNYkfy1WWLeNrxlXiK8vs/zGI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy_tester";
  version = "0.0.2-4";
  src = sources.joy_tester;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.tkinter rclpy sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Simple GUI tool for testing joysticks/gamepads";
  };
}
