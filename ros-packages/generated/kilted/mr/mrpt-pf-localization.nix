{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-relocalization,
  mp2p-icp,
  mrpt-libgui,
  mrpt-libros-bridge,
  mrpt-libslam,
  mrpt-msgs,
  mrpt-msgs-bridge,
  mrpt-tutorials,
  nav-msgs,
  pose-cov-ops,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_pf_localization";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."mrpt_pf_localization";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mola-relocalization mp2p-icp mrpt-libgui mrpt-libros-bridge mrpt-libslam mrpt-msgs mrpt-msgs-bridge nav-msgs pose-cov-ops rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mola-relocalization mp2p-icp mrpt-libgui mrpt-libros-bridge mrpt-libslam mrpt-msgs mrpt-msgs-bridge nav-msgs pose-cov-ops rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ mrpt-tutorials ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_pf_localization" = substituteSource {
      src = fetchgit {
        name = "mrpt_pf_localization-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "c1576ccf114cf09a98de911e063505dd40154f63";
        hash = "sha256-yz7cC8ZS5m09JLBuO3pI0XNZ5RgBFHRjFEPatzpT6WA=";
      };
    };
  });
  meta = {
    description = "Package for robot 2D self-localization using dynamic or static (MRPT or ROS) maps.\n	The interface is similar to amcl (https://wiki.ros.org/amcl)\n   but supports different particle-filter algorithms, several grid maps at\n   different heights, range-only localization, etc.";
  };
})
