{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  qt5,
  rclcpp,
  rcpputils,
  rosidl_runtime_cpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_image_overlay_layer = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "02784b28cc1e852177b9e4d0b25b49f144422fe6";
        hash = "sha256-w86vqlc7t/EJJOh8aI+DT1ECcEMdvidOeDtsyDhjTXc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_overlay_layer";
  version = "0.3.1-4";
  src = sources.rqt_image_overlay_layer;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib qt5.qtbase rclcpp rcpputils rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Provides an rqt_image_overlay_layer plugin interface, and a template impelementation class";
  };
}
