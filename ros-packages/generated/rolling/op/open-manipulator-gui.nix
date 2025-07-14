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
  version = "4.0.5-1";
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
        rev = "90ae44591de64b721158f2ebac1dfa9c3371fd11";
        hash = "sha256-LMz/RoBBjD7yAjqi+Om2nLV3yY6BDHt/+mY3c2cZ2r0=";
      };
    };
  });
  meta = {
    description = "\n    The OpenMANIPULATOR GUI ROS 2 package enables users to explore Joint Space,\n    Task Space, and even work with the Task Constructor functionality.  ";
  };
})
