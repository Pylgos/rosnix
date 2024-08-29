{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  cmake,
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
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mola_bridge_ros2 = substituteSource {
      src = fetchgit {
        name = "mola_bridge_ros2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "e45320ad8a369e026ea8c934308e65f0c91a5fdd";
        hash = "sha256-+vDCJ6DlAXyN1eeuopH6rflceiHIgKKjkSRSjaYqt2I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_bridge_ros2";
  version = "1.1.3-1";
  src = sources.mola_bridge_ros2;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mola_common mola_kernel mola_msgs mrpt_libmaps mrpt_libros_bridge nav_msgs rclcpp sensor_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ament_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Bidirectional bridge ROS2-MOLA";
  };
}
