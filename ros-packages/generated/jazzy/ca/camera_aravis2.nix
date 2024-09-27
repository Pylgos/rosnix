{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_aravis2_msgs,
  camera_info_manager,
  cv_bridge,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "camera_aravis2" = substituteSource {
      src = fetchgit {
        name = "camera_aravis2-source";
        url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
        rev = "5f3e3d8ced22c864b03026f8804b1a5b45aa0648";
        hash = "sha256-5Ah7DOmJ1tb7bQ9XttTlDnsH6igmEM8S5i3sZm4pWZc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "camera_aravis2";
  version = "1.0.0-1";
  src = sources."camera_aravis2";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_aravis2_msgs camera_info_manager cv_bridge diagnostic_msgs image_transport rclcpp rclcpp_components sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "aravis-dev" "libglib-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 camera driver for [GenICam](https://www.emva.org/standards-technology/genicam/)-based GigEVision and USB3Vision cameras.";
  };
}
