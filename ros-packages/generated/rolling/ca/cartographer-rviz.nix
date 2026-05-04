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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cartographer_rviz";
  version = "2.0.9003-2";
  src = finalAttrs.passthru.sources."cartographer_rviz";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cartographer cartographer-ros cartographer-ros-msgs pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libabsl-dev" "libboost-iostreams-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cartographer cartographer-ros cartographer-ros-msgs pluginlib rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libabsl-dev" "libboost-iostreams-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cartographer_rviz" = substituteSource {
      src = fetchgit {
        name = "cartographer_rviz-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "ad227fa4c297d75e6568e055080363abc3fa3f27";
        hash = "sha256-HBhTH+7iZCDSV9zi8Okp+MFALOAAQc3TV+szBXmIvPU=";
      };
    };
  });
  meta = {
    description = "\n    Cartographer is a system that provides real-time simultaneous localization\n    and mapping (SLAM) in 2D and 3D across multiple platforms and sensor\n    configurations. This package provides Cartographer's RViz integration.\n  ";
  };
})
