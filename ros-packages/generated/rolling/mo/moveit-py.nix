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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_py";
  version = "2.14.1-2";
  src = finalAttrs.passthru.sources."moveit_py";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface octomap-msgs pybind11-vendor rclcpp rclpy ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs moveit-core moveit-ros-planning moveit-ros-planning-interface octomap-msgs pybind11-vendor rclcpp rclpy ];
  checkInputs = [ ament-cmake-pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_py" = substituteSource {
      src = fetchgit {
        name = "moveit_py-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a192c2fb7e6746669d9e0bbe32d47230701fe469";
        hash = "sha256-sK7vW5seLedKAJs0jt70jigEbK0PmX6Vpb/TximYdk0=";
      };
    };
  });
  meta = {
    description = "Python binding for MoveIt 2";
  };
})
