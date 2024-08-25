{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_relocalization,
  mp2p_icp,
  mrpt2,
  mrpt_msgs,
  mrpt_msgs_bridge,
  mrpt_tutorials,
  nav_msgs,
  pose_cov_ops,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mrpt_pf_localization = substituteSource {
      src = fetchgit {
        name = "mrpt_pf_localization-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "d7fa93e90102f943aa1635b0f1f9162beac5e052";
        hash = "sha256-wvrhY5cAF3qKaJR2wB46a32QiYnMibCdMq8LpgUf5fg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pf_localization";
  version = "2.1.0-1";
  src = sources.mrpt_pf_localization;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_relocalization mp2p_icp mrpt2 mrpt_msgs mrpt_msgs_bridge nav_msgs pose_cov_ops sensor_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ mrpt_tutorials ];
  missingDependencies = [  ];
  meta = {
    description = "Package for robot 2D self-localization using dynamic or static (MRPT or ROS) maps. The interface is similar to amcl (https://wiki.ros.org/amcl) but supports different particle-filter algorithms, several grid maps at different heights, range-only localization, etc.";
  };
}
