{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  ros_gz_sim_demos,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz-bda31df298319c5fc91977db2ca70c1b7bf65c36 = substituteSource {
      src = fetchgit {
        name = "ros_gz-bda31df298319c5fc91977db2ca70c1b7bf65c36-source";
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
  src = sources.ros_gz-bda31df298319c5fc91977db2ca70c1b7bf65c36;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros_gz_bridge ros_gz_image ros_gz_sim ros_gz_sim_demos ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta-package containing interfaces for using ROS 2 with";
  };
}
