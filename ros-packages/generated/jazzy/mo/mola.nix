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
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "mola" = substituteSource {
      src = fetchgit {
        name = "mola-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "db3202810c23eee04e8c8c5c7c9f316d59db958d";
        hash = "sha256-ipO82jeMotVk0cSmiGBk8V7jn/4frQFFnEwGqowuf64=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mola";
  version = "1.2.0-1";
  src = sources."mola";
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
