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
  version = "0.2.1-2";
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
        rev = "fada94feeb77b8cf13df649d6961dca7b0672912";
        hash = "sha256-+SV0q7RJ2Wm7iZSNiorFqbp/st9C1Mhhbuhy9djvcNc=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: MPPI Controller package.";
  };
})
