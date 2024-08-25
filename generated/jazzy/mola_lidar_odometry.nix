{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_input_kitti360_dataset,
  mola_input_kitti_dataset,
  mola_input_mulran_dataset,
  mola_input_paris_luco_dataset,
  mola_input_rawlog,
  mola_input_rosbag2,
  mola_kernel,
  mola_launcher,
  mola_metric_maps,
  mola_navstate_fuse,
  mola_pose_list,
  mola_test_datasets,
  mola_viz,
  mp2p_icp,
  mrpt2,
  ros_environment,
  rosbag2_storage_mcap,
  substituteSource,
}:
let
  sources = rec {
    mola_lidar_odometry = substituteSource {
      src = fetchgit {
        name = "mola_lidar_odometry-source";
        url = "https://github.com/ros2-gbp/mola_lidar_odometry-release.git";
        rev = "feeccabc9e3d0dfaf58916d57ec4342f2cf12fc2";
        hash = "sha256-M/9bb7/plOpEEkB5gkKtrbVMgxfO1zLJlkfOmc9TQEA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_lidar_odometry";
  version = "0.3.1-1";
  src = sources.mola_lidar_odometry;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_input_kitti360_dataset mola_input_kitti_dataset mola_input_mulran_dataset mola_input_paris_luco_dataset mola_input_rawlog mola_input_rosbag2 mola_kernel mola_launcher mola_navstate_fuse mola_pose_list mola_viz mp2p_icp mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_xmllint ament_lint_auto ament_lint_cmake mola_metric_maps mola_test_datasets rosbag2_storage_mcap ];
  missingDependencies = [  ];
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
}
