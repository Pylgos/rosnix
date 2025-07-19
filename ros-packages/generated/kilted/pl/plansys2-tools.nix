{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  plansys2-msgs,
  plansys2-problem-expert,
  qt-gui-cpp,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-cpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_tools";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."plansys2_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ plansys2-msgs plansys2-problem-expert qt-gui-cpp rclcpp rclcpp-lifecycle rqt-gui rqt-gui-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-problem-expert qt-gui-cpp rclcpp rclcpp-lifecycle rqt-gui rqt-gui-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_tools" = substituteSource {
      src = fetchgit {
        name = "plansys2_tools-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "4b28c9613d55ec51199a86630237c3cc88ea3c5e";
        hash = "sha256-SHC6hw0VpYjbwQ4o/4PBiahEZH6DNNZ8MSHrhD4V0Pk=";
      };
    };
  });
  meta = {
    description = "A set of tools for monitoring ROS2 Planning System";
  };
})
