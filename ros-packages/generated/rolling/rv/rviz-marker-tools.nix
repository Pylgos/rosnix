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
  version = "0.1.5-1";
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
        rev = "e56dc8c99798e1e9b76db74c62810ba1a0100e85";
        hash = "sha256-F6llN1aJH0Ro3QeNAJ+3J9xWVtJkIeENLSmEh48E/UM=";
      };
    };
  });
  meta = {
    description = "Tools for marker creation / handling";
  };
})
