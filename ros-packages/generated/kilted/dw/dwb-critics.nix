{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  costmap-queue,
  dwb-core,
  dwb-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  nav-2d-utils,
  nav2-common,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_critics";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."dwb_critics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles costmap-queue dwb-core dwb-msgs geometry-msgs nav2-common nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles costmap-queue dwb-core dwb-msgs geometry-msgs nav2-common nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_critics" = substituteSource {
      src = fetchgit {
        name = "dwb_critics-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "be1e1e6041e848a64e744088b2d68ed554f3b1cb";
        hash = "sha256-F7tU45oAT5F2kmS67ABiPdYXRRV9RVKMQuvphySIJgU=";
      };
    };
  });
  meta = {
    description = "The dwb_critics package";
  };
})
