{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  cartographer,
  cartographer-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  mkSourceSet,
  nav-msgs,
  pcl-conversions,
  rclcpp,
  robot-state-publisher,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-msgs,
  tf2-ros,
  urdf,
  visualization-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "cartographer_ros" = substituteSource {
      src = fetchgit {
        name = "cartographer_ros-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "3d872cd7a18b999cdf018395efa737ad62005e46";
        hash = "sha256-VvGxCdcHPGbZC+Mp6BMa4qpdJ2eoz0PuoBvhe/6gtCE=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "cartographer_ros";
  version = "2.0.9003-1";
  src = finalAttrs.passthru.sources."cartographer_ros";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "google-mock" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces cartographer cartographer-ros-msgs geometry-msgs launch nav-msgs pcl-conversions rclcpp robot-state-publisher rosbag2-cpp rosbag2-storage sensor-msgs std-msgs tf2 tf2-eigen tf2-msgs tf2-ros urdf visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libabsl-dev" "libgflags-dev" "libgoogle-glog-dev" "libpcl-all-dev" "python3-sphinx" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations. This package provides Cartographer's ROS integration.";
  };
})
