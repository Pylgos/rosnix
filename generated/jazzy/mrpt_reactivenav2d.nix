{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt_libnav,
  mrpt_libros_bridge,
  mrpt_nav_interfaces,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    mrpt_reactivenav2d = substituteSource {
      src = fetchgit {
        name = "mrpt_reactivenav2d-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "52679183c558dafd28664a62d157ebc7bba5b32e";
        hash = "sha256-Vj9I31JX2xSEyVzzvOJsDGzP5jNL8CpFjeXHuVWczJA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_reactivenav2d";
  version = "2.1.1-1";
  src = sources.mrpt_reactivenav2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mrpt_libnav mrpt_libros_bridge mrpt_nav_interfaces nav_msgs rclcpp rclcpp_components sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Reactive navigation for wheeled robots using MRPT navigation algorithms (TP-Space)";
  };
}
