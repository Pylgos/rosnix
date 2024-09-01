{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  ros_gz_sim_demos,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz = substituteSource {
      src = fetchgit {
        name = "ros_gz-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "bda31df298319c5fc91977db2ca70c1b7bf65c36";
        hash = "sha256-OGwasYv0j5bC5JQALPbbM0mw8w+9aov2omYWk3MdZcE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz";
  version = "1.0.4-1";
  src = sources.ros_gz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ros_gz_image ros_gz_sim ros_gz_sim_demos ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with";
  };
}
