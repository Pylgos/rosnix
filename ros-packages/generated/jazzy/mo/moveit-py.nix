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
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_py";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface octomap-msgs pybind11-vendor rclcpp rclpy ];
  checkInputs = [ ament-cmake-pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_py" = substituteSource {
      src = fetchgit {
        name = "moveit_py-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "fbb73ec876515704ddbda503e62491662db9c08b";
        hash = "sha256-HYQmKYA+g6dh7UxuiJhWPdsjJVvlBlCnYw/ZfV77sIA=";
      };
    };
  });
  meta = {
    description = "Python binding for MoveIt 2";
  };
})
