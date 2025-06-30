{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-gui-vendor,
  gz-msgs-vendor,
  gz-plugin-vendor,
  gz-rendering-vendor,
  gz-sim-vendor,
  gz-transport-vendor,
  menge-vendor,
  mkSourceSet,
  rclcpp,
  rmf-door-msgs,
  rmf-fleet-msgs,
  rmf-lift-msgs,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_building_sim_gz_plugins";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."rmf_building_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor menge-vendor rclcpp rmf-door-msgs rmf-fleet-msgs rmf-lift-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor menge-vendor rclcpp rmf-door-msgs rmf-fleet-msgs rmf-lift-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "f0337d0ae736ff7bcd835680fcbea045c3f7aa74";
        hash = "sha256-1+uAnaqWbB3QngfSvbWsnf05fyvgKALT1HXzqUNALGY=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo plugins for building infrastructure simulation\n  ";
  };
})
