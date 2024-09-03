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
  mrpt_libmaps,
  mrpt_libtclap,
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
        rev = "92843073b9960b44335c0b82b531ef3ae8ddb190";
        hash = "sha256-Kk/DGvTlVBDHrcVpQPS225NY2iZQ1Q/ZRXk+jsWZqrs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_lidar_odometry";
  version = "0.3.3-1";
  src = sources.mola_lidar_odometry;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_input_kitti360_dataset mola_input_kitti_dataset mola_input_mulran_dataset mola_input_paris_luco_dataset mola_input_rawlog mola_input_rosbag2 mola_kernel mola_launcher mola_navstate_fuse mola_pose_list mola_viz mp2p_icp mrpt_libmaps mrpt_libtclap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_xmllint ament_lint_auto ament_lint_cmake mola_metric_maps mola_test_datasets rosbag2_storage_mcap ];
  missingDependencies = [  ];
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
}
