{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_sim_vendor,
  launch_xml,
  rmf_building_sim_gz_plugins,
  rmf_demos,
  rmf_robot_sim_gz_plugins,
  ros2launch,
  rosSystemPackages,
  ros_gz_bridge,
  substituteSource,
  teleop_twist_keyboard,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_demos_gz = substituteSource {
      src = fetchFromGitHub {
        name = "rmf_demos_gz-source";
        owner = "ros2-gbp";
        repo = "rmf_demos-release";
        rev = "29c18cb399ba028da1a30cbca69082981b52a770";
        hash = "sha256-t3SCEaDdsSY779uKQlTe7KpS+QNfowrHfD3Yrn46cd8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_gz";
  version = "2.4.0-1";
  src = sources.rmf_demos_gz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_sim_vendor launch_xml rmf_building_sim_gz_plugins rmf_demos rmf_robot_sim_gz_plugins ros2launch ros_gz_bridge teleop_twist_keyboard ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Launch files for RMF demos using the Gazebo simulator";
  };
}
