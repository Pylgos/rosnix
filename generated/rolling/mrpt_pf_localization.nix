{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_relocalization,
  mp2p_icp,
  mrpt_libgui,
  mrpt_libros_bridge,
  mrpt_libslam,
  mrpt_msgs,
  mrpt_msgs_bridge,
  mrpt_tutorials,
  nav_msgs,
  pose_cov_ops,
  rclcpp,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mrpt_pf_localization = substituteSource {
      src = fetchgit {
        name = "mrpt_pf_localization-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "e6c1ab12ba9699dda67f22380de03f10ed0aedf0";
        hash = "sha256-UsMeijiElVebNnauEAXIlsUoIy1o7qccPZI0FMu7o+I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pf_localization";
  version = "2.1.1-1";
  src = sources.mrpt_pf_localization;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_relocalization mp2p_icp mrpt_libgui mrpt_libros_bridge mrpt_libslam mrpt_msgs mrpt_msgs_bridge nav_msgs pose_cov_ops rclcpp sensor_msgs std_msgs tf2 tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ mrpt_tutorials ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for robot 2D self-localization using dynamic or static (MRPT or ROS) maps. The interface is similar to amcl (https://wiki.ros.org/amcl) but supports different particle-filter algorithms, several grid maps at different heights, range-only localization, etc.";
  };
}
