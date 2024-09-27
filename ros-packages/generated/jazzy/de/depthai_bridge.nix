{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  camera_info_manager,
  composition_interfaces,
  cv_bridge,
  depthai,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg_image_transport_msgs,
  image_transport,
  mkSourceSet,
  rclcpp,
  robot_state_publisher,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  vision_msgs,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "depthai_bridge" = substituteSource {
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "e3e759286e8a64dc356dc9b9b7d46e87f65ad438";
        hash = "sha256-EPZDRhsYvK3tHASVb5R0u3fcyaLQMiSNsI7YZ21OWLM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "depthai_bridge";
  version = "2.10.1-1";
  src = sources."depthai_bridge";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp camera_info_manager composition_interfaces cv_bridge depthai depthai_ros_msgs ffmpeg_image_transport_msgs image_transport rclcpp robot_state_publisher sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros vision_msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The depthai_bridge package";
  };
}
