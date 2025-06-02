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
  nav2-common,
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
  pname = "nav2_regulated_pure_pursuit_controller";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."nav2_regulated_pure_pursuit_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util pluginlib rclcpp tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_regulated_pure_pursuit_controller" = substituteSource {
      src = fetchgit {
        name = "nav2_regulated_pure_pursuit_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b9c23659c7f4855be564af2422f3ce44f53c5213";
        hash = "sha256-Ev0BfA1aQnh1eQq9M0eDmsH58J5Lf4cohwkgRisJf9g=";
      };
    };
  });
  meta = {
    description = "Regulated Pure Pursuit Controller";
  };
})
