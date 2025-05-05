{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-core,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  octomap-msgs,
  pybind11-vendor,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_py";
  version = "2.12.3-1";
  src = finalAttrs.passthru.sources."moveit_py";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface octomap-msgs pybind11-vendor rclcpp rclpy ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface octomap-msgs pybind11-vendor rclcpp rclpy ];
  checkInputs = [ ament-cmake-pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_py" = substituteSource {
      src = fetchgit {
        name = "moveit_py-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9d0e748f9a45eebd3213f8626c22cb74edf20a9e";
        hash = "sha256-jn5lw29FtyBZh/nQGBSEiVHjI7wADPfYzj8Oe4uvBDE=";
      };
    };
  });
  meta = {
    description = "Python binding for MoveIt 2";
  };
})
