{
  ackermann_msgs,
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_tesla-aa8ec1f78d81c93dbc9209426f921a309fcf2d3d = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tesla-aa8ec1f78d81c93dbc9209426f921a309fcf2d3d-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "aa8ec1f78d81c93dbc9209426f921a309fcf2d3d";
        hash = "sha256-EgiN0ZldemtOfOdvupDqu2SL+ieC5jRLvULy0+7ejsU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_tesla";
  version = "2023.1.3-1";
  src = sources.webots_ros2_tesla-aa8ec1f78d81c93dbc9209426f921a309fcf2d3d;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ackermann_msgs builtin_interfaces rclpy webots_ros2_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Tesla ROS2 interface for Webots.";
  };
}
