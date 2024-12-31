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
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "plansys2_lifecycle_manager-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "7976abbbd4969547895ee676374ad914293ab124";
        hash = "sha256-VYd0ulDlU/4xafW1ZabUER0PTdiMvUL8Vmhiv2R4tEc=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the ROS2 Planning System";
  };
})
