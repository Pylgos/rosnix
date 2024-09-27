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
    message_tf_frame_transformer-bfe9a7f73c48565396efa8f1fa0e0b927a903b07 = substituteSource {
      src = fetchgit {
        name = "message_tf_frame_transformer-bfe9a7f73c48565396efa8f1fa0e0b927a903b07-source";
        url = "https://github.com/ros2-gbp/message_tf_frame_transformer-release.git";
        rev = "bfe9a7f73c48565396efa8f1fa0e0b927a903b07";
        hash = "sha256-vWCcNT8fLXTKeJfhSDyA/wyHJjnuC3gX+U4gtEZXfCA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "message_tf_frame_transformer";
  version = "1.1.2-1";
  src = sources.message_tf_frame_transformer-bfe9a7f73c48565396efa8f1fa0e0b927a903b07;
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
