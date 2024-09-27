{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt_libhwdrivers,
  mrpt_libros_bridge,
  mrpt_msgs,
  mrpt_sensorlib,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensor_bumblebee_stereo-a3ff6a91d54ab63f950a534275ec9696d6abd1c0 = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_bumblebee_stereo-a3ff6a91d54ab63f950a534275ec9696d6abd1c0-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "a3ff6a91d54ab63f950a534275ec9696d6abd1c0";
        hash = "sha256-RdSetxlV3aRkTreC+ol1ENdwAu440EnXqTubJg53Q48=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_bumblebee_stereo";
  version = "0.2.3-1";
  src = sources.mrpt_sensor_bumblebee_stereo-a3ff6a91d54ab63f950a534275ec9696d6abd1c0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libhwdrivers mrpt_libros_bridge mrpt_msgs mrpt_sensorlib nav_msgs rclcpp rclcpp_components sensor_msgs std_msgs stereo_msgs tf2 tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS node for Bumblebee Stereo Cameras using libdc1394 interface (based on mrpt-hwdrivers)";
  };
}
