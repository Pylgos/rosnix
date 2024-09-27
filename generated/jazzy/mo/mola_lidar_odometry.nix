{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
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
  rosSystemPackages,
  ros_environment,
  rosbag2_storage_mcap,
  substituteSource,
}:
let
  sources = rec {
    mola_lidar_odometry-3b0e15e1fc3c9acfaf0f263a7120d9bf9d1b3203 = substituteSource {
      src = fetchgit {
        name = "mola_lidar_odometry-3b0e15e1fc3c9acfaf0f263a7120d9bf9d1b3203-source";
        url = "https://github.com/ros2-gbp/mola_lidar_odometry-release.git";
        rev = "3b0e15e1fc3c9acfaf0f263a7120d9bf9d1b3203";
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
  src = sources.mola_lidar_odometry-3b0e15e1fc3c9acfaf0f263a7120d9bf9d1b3203;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mola_input_kitti360_dataset mola_input_kitti_dataset mola_input_mulran_dataset mola_input_paris_luco_dataset mola_input_rawlog mola_input_rosbag2 mola_kernel mola_launcher mola_navstate_fuse mola_pose_list mola_viz mp2p_icp mrpt_libmaps mrpt_libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_xmllint ament_lint_auto ament_lint_cmake mola_metric_maps mola_test_datasets rosbag2_storage_mcap ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "LIDAR odometry system based on MOLA and MRPT components";
  };
}
