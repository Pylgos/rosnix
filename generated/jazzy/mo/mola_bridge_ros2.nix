{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mola_common,
  mola_kernel,
  mola_msgs,
  mrpt_libmaps,
  mrpt_libros_bridge,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mola_bridge_ros2-66777666192d9b2510648971c8ac5265155dc55c = substituteSource {
      src = fetchgit {
        name = "mola_bridge_ros2-66777666192d9b2510648971c8ac5265155dc55c-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "66777666192d9b2510648971c8ac5265155dc55c";
        hash = "sha256-ULBVt/bMvtpdMO0lt7ER9jz+C2W3n5Fn9jpmnt/S2fU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_bridge_ros2";
  version = "1.2.0-1";
  src = sources.mola_bridge_ros2-66777666192d9b2510648971c8ac5265155dc55c;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs mola_common mola_kernel mola_msgs mrpt_libmaps mrpt_libros_bridge nav_msgs rclcpp sensor_msgs tf2 tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Bidirectional bridge ROS2-MOLA";
  };
}
