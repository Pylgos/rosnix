{
  ament-cmake,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-core,
  moveit-msgs,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_gui";
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."open_manipulator_gui";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module rclcpp ];
  propagatedBuildInputs = [ geometry-msgs moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_gui" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_gui-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "1d9293a15ca18ef6c00f139b9003272475ae9cc2";
        hash = "sha256-vebgvHnMxcNoEvvpTtfSCkgZEOQPsOV2pWukaHA7x/0=";
      };
    };
  });
  meta = {
    description = "The OpenMANIPULATOR-X GUI ROS 2 package enables users to explore Joint Space, Task Space, and even work with the Task Constructor functionality.";
  };
})
