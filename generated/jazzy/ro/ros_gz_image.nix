{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_msgs_vendor,
  gz_transport_vendor,
  image_transport,
  rclcpp,
  rosSystemPackages,
  ros_gz_bridge,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_gz_image-13244388c8ca31c89d5f4cb97eaa8b407cc85bc5 = substituteSource {
      src = fetchgit {
        name = "ros_gz_image-13244388c8ca31c89d5f4cb97eaa8b407cc85bc5-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "13244388c8ca31c89d5f4cb97eaa8b407cc85bc5";
        hash = "sha256-GbUPZkFipoVMuk/huC08Lb1JBLL8ScNr17fT48mOm64=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_image";
  version = "1.0.4-1";
  src = sources.ros_gz_image-13244388c8ca31c89d5f4cb97eaa8b407cc85bc5;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_msgs_vendor gz_transport_vendor image_transport rclcpp ros_gz_bridge sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
  };
}
