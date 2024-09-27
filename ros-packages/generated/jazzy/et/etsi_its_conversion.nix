{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_conversion,
  etsi_its_cam_ts_conversion,
  etsi_its_cpm_ts_conversion,
  etsi_its_denm_conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "766c0d9cf155ffbcc708d1048df9b643685494c4";
        hash = "sha256-eMA2CBwjcURfZ0FZEqgB3/M+NvIGCuy2ktTI4QgilgE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "etsi_its_conversion";
  version = "2.2.0-1";
  src = sources."etsi_its_conversion";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_cam_conversion etsi_its_cam_ts_conversion etsi_its_cpm_ts_conversion etsi_its_denm_conversion rclcpp rclcpp_components std_msgs udp_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Converts ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
}
