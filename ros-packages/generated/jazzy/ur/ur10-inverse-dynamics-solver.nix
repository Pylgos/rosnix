{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  inverse-dynamics-solver,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros-testing,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  substituteSource,
  trajectory-msgs,
  ur-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur10_inverse_dynamics_solver";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."ur10_inverse_dynamics_solver";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ inverse-dynamics-solver pluginlib ur-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ inverse-dynamics-solver pluginlib ur-description ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp ros-testing rosbag2-cpp rosbag2-storage rosbag2-storage-default-plugins trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ur10_inverse_dynamics_solver" = substituteSource {
      src = fetchgit {
        name = "ur10_inverse_dynamics_solver-source";
        url = "https://github.com/ros2-gbp/inverse_dynamics_solver-release.git";
        rev = "d5d349680417bf1fd470aa31ac4fa74acf0b0ddb";
        hash = "sha256-Mprq47LcrFcMxdpAz8mQ3+l+fr7jEQLAAuea/9ULBzo=";
      };
    };
  });
  meta = {
    description = "A C++ library implementing the inverse dynamics solver for the UR10 real robot.";
  };
})
