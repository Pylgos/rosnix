{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt2,
  mrpt_msgs,
  mrpt_nav_interfaces,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
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
        rev = "8b0dc726c4519d3efb5483e6671ca415179f0aff";
        hash = "sha256-yMNB8YAsNsXmMtF0eCS6TnOTQLzEtkl69Yw5qkqf5V8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_reactivenav2d";
  version = "2.1.0-1";
  src = sources.mrpt_reactivenav2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mrpt2 mrpt_msgs mrpt_nav_interfaces nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Reactive navigation for wheeled robots using MRPT navigation algorithms (TP-Space)";
  };
}
