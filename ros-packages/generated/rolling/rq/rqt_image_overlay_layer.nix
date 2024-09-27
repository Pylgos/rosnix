{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rqt_image_overlay_layer" = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "71eb34413096964598d59056f09bf259cad187a8";
        hash = "sha256-w86vqlc7t/EJJOh8aI+DT1ECcEMdvidOeDtsyDhjTXc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rqt_image_overlay_layer";
  version = "0.3.1-3";
  src = sources."rqt_image_overlay_layer";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rcpputils rosidl_runtime_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides an rqt_image_overlay_layer plugin interface, and a template impelementation class";
  };
}
