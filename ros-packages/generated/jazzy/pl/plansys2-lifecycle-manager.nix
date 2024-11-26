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
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "plansys2_lifecycle_manager" = substituteSource {
        src = fetchgit {
          name = "plansys2_lifecycle_manager-source";
          url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
          rev = "0025106e1eb051411f94d034baf42b171d5388b6";
          hash = "sha256-PdojLkDXi7Cs+cKbfq4iKNf+ztXeGJsnWs032nsQQAY=";
        };
      };
    });
  };
  meta = {
    description = "A controller/manager for the lifecycle nodes of the ROS2 Planning System";
  };
})
