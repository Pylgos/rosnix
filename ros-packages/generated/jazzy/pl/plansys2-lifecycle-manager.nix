{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_lifecycle_manager";
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "plansys2_lifecycle_manager-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "9056797ab25a765b7b52f8067c7a11fb8cbc1d69";
        hash = "sha256-/DN+U4NozZt5pWed/hi0s12I06gufFUh/TUFjUy6wx0=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the ROS2 Planning System";
  };
})
