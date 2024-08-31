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
        rev = "f9340f91787520cd33095d5331d5f9e918c7b835";
        hash = "sha256-A9RmRetwUHbzOBNPPnLl9Tje8lANOv2u73GZPgsLRJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz";
  version = "2.0.0-1";
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
