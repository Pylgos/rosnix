{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  zbar_ros_interfaces,
}:
let
  sources = mkSourceSet (sources: {
    "zbar_ros" = substituteSource {
      src = fetchgit {
        name = "zbar_ros-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "05fd200a692259be91d98d3c95f134ab7a2b8f3d";
        hash = "sha256-ABj7YLhPfSz7aMGTa8kmb/hLGuY9WLHpwfxsdwZbBWI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "zbar_ros";
  version = "0.7.0-1";
  src = sources."zbar_ros";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge rclcpp sensor_msgs std_msgs zbar_ros_interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zbar" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge .net/)";
  };
}