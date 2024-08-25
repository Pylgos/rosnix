{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_gz_bringup,
  leo_gz_plugins,
  leo_gz_worlds,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_simulator = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "2eb3d91a1f287e2f534b9c7385b44b4b05bb07a9";
        hash = "sha256-9NYk63AFSej3cyv3E/oe0Je7ctEdJ/3W2HmArd4XKp0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_simulator";
  version = "2.0.0-1";
  src = sources.leo_simulator;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo_gz_bringup leo_gz_plugins leo_gz_worlds ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage for Leo Rover Gazebo simulation in ROS2";
  };
}
