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
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    rqt_image_overlay_layer-02784b28cc1e852177b9e4d0b25b49f144422fe6 = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-02784b28cc1e852177b9e4d0b25b49f144422fe6-source";
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
  src = sources.rqt_image_overlay_layer-02784b28cc1e852177b9e4d0b25b49f144422fe6;
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
