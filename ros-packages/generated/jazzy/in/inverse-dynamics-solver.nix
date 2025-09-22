{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  sensor-msgs,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "inverse_dynamics_solver";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pluginlib rclcpp rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "python-argparse" "python3-matplotlib" "python3-numpy" "python3-tabulate" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rclcpp rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins sensor-msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python-argparse" "python3-matplotlib" "python3-numpy" "python3-tabulate" ]; };
  passthru.sources = mkSourceSet (sources: {
    "inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "e3cd508b262b01670933b1dece7e319bb6a6e81f";
        hash = "sha256-yJi4OvtnIlGWjqUBggJcNTIji1TBD5SAw+LVPmpTpUk=";
      };
    };
  });
  meta = {
    description = "A library implementing an inverse dynamics solver for serial manipulators.";
  };
})
