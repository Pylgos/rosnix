{
  ament_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kitti_metrics_eval,
  mola_bridge_ros2,
  mola_demos,
  mola_imu_preintegration,
  mola_input_euroc_dataset,
  mola_input_kitti360_dataset,
  mola_input_kitti_dataset,
  mola_input_mulran_dataset,
  mola_input_paris_luco_dataset,
  mola_input_rawlog,
  mola_input_rosbag2,
  mola_kernel,
  mola_launcher,
  mola_metric_maps,
  mola_navstate_fg,
  mola_navstate_fuse,
  mola_pose_list,
  mola_relocalization,
  mola_traj_tools,
  mola_viz,
  mola_yaml,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola = substituteSource {
      src = fetchgit {
        name = "mola-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "5d6fd29d953185f9b9c6ea46f601ab135ae5d7d7";
        hash = "sha256-DxjylXYyJhLgN3d3GCHOmfU8e4v02LodObotMFL4wTk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola";
  version = "1.1.3-1";
  src = sources.mola;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ kitti_metrics_eval mola_bridge_ros2 mola_demos mola_imu_preintegration mola_input_euroc_dataset mola_input_kitti360_dataset mola_input_kitti_dataset mola_input_mulran_dataset mola_input_paris_luco_dataset mola_input_rawlog mola_input_rosbag2 mola_kernel mola_launcher mola_metric_maps mola_navstate_fg mola_navstate_fuse mola_pose_list mola_relocalization mola_traj_tools mola_viz mola_yaml ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage with all core open-sourced MOLA packages.";
  };
}
