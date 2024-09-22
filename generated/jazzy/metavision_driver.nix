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
  event_camera_msgs,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  openeb_vendor,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  ros_environment,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    metavision_driver = substituteSource {
      src = fetchFromGitHub {
        name = "metavision_driver-source";
        owner = "ros2-gbp";
        repo = "metavision_driver-release";
        rev = "10673e148700ada37cbc7197debd5f3beb1e3b38";
        hash = "sha256-cY39QdEEs1lKLaScyeWrofuyVggQEi1Ofnc2JlfEv34=";
      };
      substitutions = [
        {
          path = "cmake/ROS1.cmake";
          from = "GIT_REPOSITORY https://github.com/ros-event-camera/openeb.git";
          to = "URL ${metavision_driver-vendor_source-openeb-0}";
        }
      ];
    };
    metavision_driver-vendor_source-openeb-0 = substituteSource {
      src = fetchgit {
        name = "metavision_driver-vendor_source-openeb-0-source";
        url = "https://github.com/ros-event-camera/openeb.git";
        rev = "db34531b9d0fef952e39f5fef7169e583575b6e9";
        hash = "sha256-QHs3Bz6Mj08Rk8lUAIyWfMwMcoW1XCswASYhX0hfPiM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "metavision_driver";
  version = "2.0.0-1";
  src = sources.metavision_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ event_camera_msgs openeb_vendor rclcpp rclcpp_components std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS1 and ROS2 drivers for metavision based event cameras";
  };
}
