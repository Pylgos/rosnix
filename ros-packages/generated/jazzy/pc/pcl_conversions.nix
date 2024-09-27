{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pcl_msgs,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pcl_conversions-84489a5fbd00fae46cebabf8498b8db56f85ad99 = substituteSource {
      src = fetchgit {
        name = "pcl_conversions-84489a5fbd00fae46cebabf8498b8db56f85ad99-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "84489a5fbd00fae46cebabf8498b8db56f85ad99";
        hash = "sha256-JMlxHj6XMHqOVfS/n5Ir4meRb4o0pK3VoeE0GYS69FI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_conversions";
  version = "2.6.1-4";
  src = sources.pcl_conversions-84489a5fbd00fae46cebabf8498b8db56f85ad99;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ message_filters pcl_msgs rclcpp sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-io" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides conversions from PCL data types and ROS message types";
  };
}
