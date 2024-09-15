{
  ament_cmake_auto,
  buildRosPackage,
  camera_info_manager,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image_proc,
  image_transport,
  message_filters,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  stereo_image_proc,
  substituteSource,
}:
let
  sources = rec {
    avt_vimba_camera = substituteSource {
      src = fetchgit {
        name = "avt_vimba_camera-source";
        url = "https://github.com/ros2-gbp/avt_vimba_camera-release.git";
        rev = "7e56860bfcd8f29a48630b2d050f3451b0617a3b";
        hash = "sha256-b1YFGg6j0b9K0ewtxAKbcnT1um/8yTIj7XIIbEChDbY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "avt_vimba_camera";
  version = "2001.1.0-5";
  src = sources.avt_vimba_camera;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_info_manager diagnostic_msgs diagnostic_updater image_proc image_transport message_filters rclcpp rclcpp_components sensor_msgs std_msgs stereo_image_proc ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Camera driver for Allied Vision Technologies (AVT) cameras, based on their Vimba SDK.";
  };
}
