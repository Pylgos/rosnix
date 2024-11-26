{
  ament-cmake,
  buildAmentCmakePackage,
  cartographer,
  cartographer-ros,
  cartographer-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cartographer_rviz";
  version = "2.0.9003-2";
  src = finalAttrs.passthru.sources."cartographer_rviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cartographer cartographer-ros cartographer-ros-msgs pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libabsl-dev" "libboost-iostreams-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cartographer_rviz" = substituteSource {
      src = fetchgit {
        name = "cartographer_rviz-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "c0528e46728174c2c4893a6bbf43fe87ba86f2e5";
        hash = "sha256-HBhTH+7iZCDSV9zi8Okp+MFALOAAQc3TV+szBXmIvPU=";
      };
    };
  });
  meta = {
    description = "Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations. This package provides Cartographer's RViz integration.";
  };
})
