{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_index_cpp,
  buildRosPackage,
  cv_bridge,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  gps_msgs,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  marti_nav_msgs,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  swri_math_util,
  swri_roscpp,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    swri_transform_util-2449a87220579100817417aab1f33511f923c23d = substituteSource {
      src = fetchgit {
        name = "swri_transform_util-2449a87220579100817417aab1f33511f923c23d-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "2449a87220579100817417aab1f33511f923c23d";
        hash = "sha256-NbABucV7KKYYHI02DVMc9siAlEpqGZuYUkZfd+oI9jk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_transform_util";
  version = "3.7.3-1";
  src = sources.swri_transform_util-2449a87220579100817417aab1f33511f923c23d;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge diagnostic_msgs diagnostic_updater geographic_msgs geometry_msgs gps_msgs marti_nav_msgs rcl_interfaces rclcpp rclcpp_components rclpy sensor_msgs swri_math_util swri_roscpp tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "geographiclib" "geos" "proj" "python3-numpy" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_index_cpp launch_ros launch_testing launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The swri_transform_util package contains utility functions and classes for transforming between coordinate frames.";
  };
}
