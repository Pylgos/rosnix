{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  camera_info_manager,
  depth_image_proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  pkg-config,
  rclcpp,
  rclcpp_components,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    openni2_camera = substituteSource {
      src = fetchgit {
        name = "openni2_camera-source";
        url = "https://github.com/ros2-gbp/openni2_camera-release.git";
        rev = "9ff1cc5ec71a0d58ceab303ae07f79bda47fd13f";
        hash = "sha256-zluskCIVNU5rB7PJXU3uYl7qJha6gw33mZminvZOkd8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openni2_camera";
  version = "2.2.1-1";
  src = sources.openni2_camera;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces camera_info_manager depth_image_proc image_transport rclcpp rclcpp_components rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "libopenni2-dev" ];
  meta = {
    description = "Drivers for the Asus Xtion and Primesense Devices. For using a kinect with ROS, try the";
  };
}
