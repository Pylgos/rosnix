{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  qt_gui_cpp,
  rclcpp,
  rosSystemPackages,
  rqt_gui,
  rqt_gui_cpp,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_image_view-04f951986b694c547d718f8ad62b7a6019a8d127 = substituteSource {
      src = fetchgit {
        name = "rqt_image_view-04f951986b694c547d718f8ad62b7a6019a8d127-source";
        url = "https://github.com/ros2-gbp/rqt_image_view-release.git";
        rev = "04f951986b694c547d718f8ad62b7a6019a8d127";
        hash = "sha256-yg3Ts00hd8hELleYHejS5qrq7xSwPt9WphpSoj5mBTY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_view";
  version = "1.3.0-1";
  src = sources.rqt_image_view-04f951986b694c547d718f8ad62b7a6019a8d127;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs image_transport qt_gui_cpp rclcpp rqt_gui rqt_gui_cpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rqt_image_view provides a GUI plugin for displaying images using image_transport.";
  };
}
