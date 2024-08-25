{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  zbar,
  zbar_ros_interfaces,
}:
let
  sources = rec {
    zbar_ros = substituteSource {
      src = fetchgit {
        name = "zbar_ros-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "bd55b012222f2a79ae26429d1990cc2e818de827";
        hash = "sha256-WZR9JZCFn6iUWjl8bwdsbzYpvyCWFaOPEmSgu8WuO0A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zbar_ros";
  version = "0.6.0-1";
  src = sources.zbar_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge rclcpp sensor_msgs std_msgs zbar zbar_ros_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge .net/)";
  };
}
