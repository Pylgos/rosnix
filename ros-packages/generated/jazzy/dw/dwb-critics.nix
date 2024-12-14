{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  costmap-queue,
  dwb-core,
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
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dwb_critics";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."dwb_critics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles costmap-queue dwb-core geometry-msgs nav2-common nav2-costmap-2d nav2-util nav-2d-msgs nav-2d-utils pluginlib rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dwb_critics" = substituteSource {
      src = fetchgit {
        name = "dwb_critics-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8430c241f5d85313c9a27f3c972ac892760d5084";
        hash = "sha256-lsUXp5dezo4qOkBlnClVo0uBtHsymJMRLWiNtUgGi7U=";
      };
    };
  });
  meta = {
    description = "The dwb_critics package";
  };
})
