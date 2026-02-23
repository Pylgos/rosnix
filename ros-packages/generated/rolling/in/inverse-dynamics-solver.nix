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
  version = "6.0.1-3";
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
        rev = "905bdc645c0cab864398ad48d4652ab94d5b5c72";
        hash = "sha256-beOndpp5mhh4Sy57TBsVyyJIFhSlWt+L1hwQnWTAuTA=";
      };
    };
  });
  meta = {
    description = "A library implementing an inverse dynamics solver for serial manipulators.";
  };
})
