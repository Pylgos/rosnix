{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
}:
let
  sources = rec {
    message_tf_frame_transformer-8365d8e62c09180ae085e4e225e5f2fb90d0439b = substituteSource {
      src = fetchgit {
        name = "message_tf_frame_transformer-8365d8e62c09180ae085e4e225e5f2fb90d0439b-source";
        url = "https://github.com/ros2-gbp/message_tf_frame_transformer-release.git";
        rev = "8365d8e62c09180ae085e4e225e5f2fb90d0439b";
        hash = "sha256-lYSUvKIMjeyVNRJsf7Qj8XGausPw6UVLCKmHL7D1St8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "message_tf_frame_transformer";
  version = "1.1.1-1";
  src = sources.message_tf_frame_transformer-8365d8e62c09180ae085e4e225e5f2fb90d0439b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp sensor_msgs tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Transforms messages of arbitrary type to a different frame using tf2::doTransform";
  };
}
