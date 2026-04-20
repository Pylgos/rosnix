{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-simple-common,
  easynav-system,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pcl-ros,
  pluginlib,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_mppi_controller";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_mppi_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core easynav-system geometry-msgs nav-msgs pcl-ros pluginlib tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core easynav-system geometry-msgs nav-msgs pcl-ros pluginlib tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common easynav-simple-common rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_mppi_controller" = substituteSource {
      src = fetchgit {
        name = "easynav_mppi_controller-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "5c8ca9550575c152adee49529c0c7ead26466e91";
        hash = "sha256-D6tyhrnNHQKUry0q4IW6yfAvP20pHMwfDW5I6gGWSt4=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: MPPI Controller package.";
  };
})
