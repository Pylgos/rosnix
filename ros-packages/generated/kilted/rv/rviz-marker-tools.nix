{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-common,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-eigen,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_marker_tools";
  version = "0.1.4-1";
  src = finalAttrs.passthru.sources."rviz_marker_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs moveit-common rclcpp std-msgs tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liburdfdom-headers-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs moveit-common rclcpp std-msgs tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liburdfdom-headers-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_marker_tools" = substituteSource {
      src = fetchgit {
        name = "rviz_marker_tools-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "7c7161530e06c527c52a78cff0d211d928f3693c";
        hash = "sha256-v6jbUh3/H1lB0YFH5XuKpzGAT8UFjRTqEpxfj9FwUk4=";
      };
    };
  });
  meta = {
    description = "Tools for marker creation / handling";
  };
})
