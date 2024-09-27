{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    joy_tester-7287ff765bbd548f037e3d25bea88aeaca17a6f2 = substituteSource {
      src = fetchgit {
        name = "joy_tester-7287ff765bbd548f037e3d25bea88aeaca17a6f2-source";
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
  src = sources.joy_tester-7287ff765bbd548f037e3d25bea88aeaca17a6f2;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-tk" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Simple GUI tool for testing joysticks/gamepads";
  };
}
