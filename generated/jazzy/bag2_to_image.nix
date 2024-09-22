{
  ament_cmake,
  ament_cmake_clang_format,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rosbag2_cpp,
  rosbag2_storage,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    bag2_to_image = substituteSource {
      src = fetchgit {
        name = "bag2_to_image-source";
        url = "https://github.com/ros2-gbp/bag2_to_image-release.git";
        rev = "3297bdaf4e1c18b523774df23c0da5d666acca50";
        hash = "sha256-D602KBwsYPh+wbNrK2y25DZk1/wPPc2PlZj4ktvPhqI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bag2_to_image";
  version = "0.1.0-5";
  src = sources.bag2_to_image;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components rosbag2_cpp rosbag2_storage sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The bag2_to_image package";
  };
}
