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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_graceful_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-2d-utils pluginlib rclcpp tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common nav2-controller ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_graceful_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_graceful_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "2709d812885d2f4c56946077d0fdf2d29866bf73";
        hash = "sha256-fRvE3JLFAbueER5iZFp9SgWr3REroxCk64c5gYsvky8=";
      };
    };
  });
  meta = {
    description = "Graceful motion controller";
  };
})
