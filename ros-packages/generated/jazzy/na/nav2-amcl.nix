{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-ros,
  launch-testing,
  message-filters,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_amcl";
  version = "1.3.10-1";
  src = finalAttrs.passthru.sources."nav2_amcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs launch-ros launch-testing message-filters nav2-common nav2-msgs nav2-util nav-msgs pluginlib rclcpp sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs launch-ros launch-testing message-filters nav2-common nav2-msgs nav2-util nav-msgs pluginlib rclcpp sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_amcl" = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "c646bf5b270909e5c4ac6f4cf40b602de02ee2d6";
        hash = "sha256-JBAqtitfnnBEFsm12oH7KPP0JHPMY9RBmTjKWkIA1Yk=";
      };
    };
  });
  meta = {
    description = "\n    ";
  };
})
