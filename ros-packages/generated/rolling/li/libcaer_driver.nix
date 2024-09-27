{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_xmllint,
  buildRosPackage,
  camera_info_manager,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libcaer_vendor,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "libcaer_driver" = substituteSource {
      src = fetchgit {
        name = "libcaer_driver-source";
        url = "https://github.com/ros2-gbp/libcaer_driver-release.git";
        rev = "56e4267b26ea29a0cf9724b87f5959723354a895";
        hash = "sha256-RkhPG89kIKkm8AePQkzjAzAZ012RtBVSK2AQZwKYHTQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "libcaer_driver";
  version = "1.0.3-1";
  src = sources."libcaer_driver";
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_info_manager event_camera_msgs image_transport libcaer_vendor rclcpp rclcpp_components sensor_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 driver for event base sensors using libcaer";
  };
}
