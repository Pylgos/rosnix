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
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mouse_teleop-a1b6b5981930da5a0565f81451b8fc95c5ab7892 = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-a1b6b5981930da5a0565f81451b8fc95c5ab7892-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "a1b6b5981930da5a0565f81451b8fc95c5ab7892";
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
  src = sources.mouse_teleop-a1b6b5981930da5a0565f81451b8fc95c5ab7892;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-tk" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A mouse teleop tool for holonomic mobile robots.";
  };
}
