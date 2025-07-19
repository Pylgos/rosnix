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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_lifecycle_manager";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."plansys2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "plansys2_lifecycle_manager-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "011d06b971915e5ac46b77d29894ddeb073ce365";
        hash = "sha256-6LeQ5yzQqblp43JCOe/rerzHpnRkWBJFmWGy7fEe5bk=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the ROS2 Planning System";
  };
})
