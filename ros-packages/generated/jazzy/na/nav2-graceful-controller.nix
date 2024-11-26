{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-utils,
  nav2-common,
  nav2-controller,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_graceful_controller";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav2_graceful_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-utils pluginlib rclcpp tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-controller ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_graceful_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_graceful_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7bc7678baa02d40c2d4d0c424756143fd8579fc4";
        hash = "sha256-izjx4heA8hpIhtF4DxY3GJa+s9cApOru+TUg2+3ci+I=";
      };
    };
  });
  meta = {
    description = "Graceful motion controller";
  };
})
