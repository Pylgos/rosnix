{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  compressed_image_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  ros_image_to_qimage,
  rqt_gui,
  rqt_gui_cpp,
  rqt_image_overlay_layer,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_image_overlay = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "086da41cf47b934b392f4c4198e9e121a566e768";
        hash = "sha256-rjv8Zxu7V4qDtMRcwMdiYByPpFiYIRJL8N+KK/Gte+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_overlay";
  version = "0.3.1-3";
  src = sources.rqt_image_overlay;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ image_transport pluginlib rclcpp ros_image_to_qimage rqt_gui rqt_gui_cpp rqt_image_overlay_layer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common compressed_image_transport std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An rqt plugin to display overlays for custom msgs on an image using plugins.";
  };
}
