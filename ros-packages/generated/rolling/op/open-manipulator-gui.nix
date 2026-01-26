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
  version = "4.1.2-1";
  src = finalAttrs.passthru.sources."open_manipulator_gui";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "qt5-qmake" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_gui" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_gui-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "1b8f6bbf5124ffa88c42078d1bb64fb820ef8126";
        hash = "sha256-1usCIKDcgHtZ7iPDJ0Vsw6MfurXEuTm8x/k8FhRDHRw=";
      };
    };
  });
  meta = {
    description = "\n    The OpenMANIPULATOR GUI ROS 2 package enables users to explore Joint Space,\n    Task Space, and even work with the Task Constructor functionality.  ";
  };
})
