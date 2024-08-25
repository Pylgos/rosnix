{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  aravis,
  buildRosPackage,
  camera_aravis2_msgs,
  camera_info_manager,
  cv_bridge,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  glib,
  image_transport,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    camera_aravis2 = substituteSource {
      src = fetchgit {
        name = "camera_aravis2-source";
        url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
        rev = "5f3e3d8ced22c864b03026f8804b1a5b45aa0648";
        hash = "sha256-5Ah7DOmJ1tb7bQ9XttTlDnsH6igmEM8S5i3sZm4pWZc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_aravis2";
  version = "1.0.0-1";
  src = sources.camera_aravis2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ aravis camera_aravis2_msgs camera_info_manager cv_bridge diagnostic_msgs glib image_transport rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 camera driver for [GenICam](https://www.emva.org/standards-technology/genicam/)-based GigEVision and USB3Vision cameras.";
  };
}
