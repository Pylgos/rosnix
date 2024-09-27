{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  qt_gui_cpp,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_gui_cpp-0ff9411e1fae5cdb1942231565a13b10a85d001b = substituteSource {
      src = fetchgit {
        name = "rqt_gui_cpp-0ff9411e1fae5cdb1942231565a13b10a85d001b-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "0ff9411e1fae5cdb1942231565a13b10a85d001b";
        hash = "sha256-JJ48LH0MfEaVb8AgbGKYBZ2v/ihBf0A2MZ267/+zhDY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_gui_cpp";
  version = "1.6.0-2";
  src = sources.rqt_gui_cpp-0ff9411e1fae5cdb1942231565a13b10a85d001b;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib qt_gui_cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS.";
  };
}
