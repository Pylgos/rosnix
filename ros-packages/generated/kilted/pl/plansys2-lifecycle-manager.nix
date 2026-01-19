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
  version = "3.0.2-1";
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
        rev = "2e05ea96807cdea1f819fa3604c60bd727031b1f";
        hash = "sha256-MCHr3pxGTYpJo5LBKsfTJm/PP8/OFMoubImbe981eew=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the ROS2 Planning System";
  };
})
