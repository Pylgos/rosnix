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
  substituteSource,
}:
let
  sources = rec {
    mola = substituteSource {
      src = fetchgit {
        name = "mola-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "c810afa079b5e8dadc26cfe73ba3f59dd6ab0254";
        hash = "sha256-ewEe0EyvrhXYRn82vyl+pZvhGleRaZRh2xfgvkz+73M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola";
  version = "1.1.0-1";
  src = sources.mola;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ kitti_metrics_eval mola_bridge_ros2 mola_demos mola_imu_preintegration mola_input_euroc_dataset mola_input_kitti360_dataset mola_input_kitti_dataset mola_input_mulran_dataset mola_input_paris_luco_dataset mola_input_rawlog mola_input_rosbag2 mola_kernel mola_launcher mola_metric_maps mola_navstate_fg mola_navstate_fuse mola_pose_list mola_relocalization mola_traj_tools mola_viz mola_yaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_xmllint ament_lint_auto ament_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage with all core open-sourced MOLA packages.";
  };
}
