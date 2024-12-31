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
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ plansys2-msgs plansys2-problem-expert qt-gui-cpp rclcpp rclcpp-lifecycle rqt-gui rqt-gui-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_tools" = substituteSource {
      src = fetchgit {
        name = "plansys2_tools-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "81b852747b855c3907c6f4627bd3c6e593381538";
        hash = "sha256-Zn42+A5o60NxBd0XxGzpYhE78Au+3q1OK/upAQouxaA=";
      };
    };
  });
  meta = {
    description = "A set of tools for monitoring ROS2 Planning System";
  };
})
