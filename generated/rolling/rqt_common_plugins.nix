{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_action,
  rqt_bag,
  rqt_bag_plugins,
  rqt_console,
  rqt_graph,
  rqt_image_view,
  rqt_msg,
  rqt_plot,
  rqt_publisher,
  rqt_py_common,
  rqt_py_console,
  rqt_reconfigure,
  rqt_service_caller,
  rqt_shell,
  rqt_srv,
  rqt_topic,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_common_plugins = substituteSource {
      src = fetchFromGitHub {
        name = "rqt_common_plugins-source";
        owner = "ros2-gbp";
        repo = "rqt_common_plugins-release";
        rev = "441dc2cb50ad084c86136f60179f89284027814f";
        hash = "sha256-rSJ8tB78EOgjtaHw8wleVvW+Rx9+z5d0IAznXj0aKmg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_common_plugins";
  version = "1.2.0-3";
  src = sources.rqt_common_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_action rqt_bag rqt_bag_plugins rqt_console rqt_graph rqt_image_view rqt_msg rqt_plot rqt_publisher rqt_py_common rqt_py_console rqt_reconfigure rqt_service_caller rqt_shell rqt_srv rqt_topic ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "rqt_common_plugins metapackage provides ROS backend graphical tools suite that can be used on/off of robot runtime.";
  };
}
