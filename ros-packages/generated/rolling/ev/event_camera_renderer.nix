{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  event_camera_codecs,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "event_camera_renderer" = substituteSource {
      src = fetchgit {
        name = "event_camera_renderer-source";
        url = "https://github.com/ros2-gbp/event_camera_renderer-release.git";
        rev = "1a5f65774a751763e22de57096c112404da85a64";
        hash = "sha256-IeNTr8GoHZGyVpcnARGctu7wHhkWdd1GXQ3n4lwZHkQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "event_camera_renderer";
  version = "1.0.4-1";
  src = sources."event_camera_renderer";
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ event_camera_codecs event_camera_msgs image_transport rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "package for rendering event_camera_msgs";
  };
}
