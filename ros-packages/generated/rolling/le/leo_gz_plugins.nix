{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_plugin_vendor,
  gz_sim_vendor,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_gz_plugins-b95db463abfebe51b54c717dfc6e80e8945a2dc1 = substituteSource {
      src = fetchgit {
        name = "leo_gz_plugins-b95db463abfebe51b54c717dfc6e80e8945a2dc1-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "b95db463abfebe51b54c717dfc6e80e8945a2dc1";
        hash = "sha256-ga6r0cJy5q52i+zHX5Xo5GGXCKsEWC34Gu3hMMr29FU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_plugins";
  version = "2.0.0-1";
  src = sources.leo_gz_plugins-b95db463abfebe51b54c717dfc6e80e8945a2dc1;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_plugin_vendor gz_sim_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Plugins for Leo Rover Gazebo simulation in ROS 2";
  };
}
