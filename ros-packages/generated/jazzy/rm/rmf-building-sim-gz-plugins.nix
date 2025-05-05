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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."rmf_building_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor menge-vendor rmf-door-msgs rmf-fleet-msgs rmf-lift-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "b4f209d394558c80991e7e17cf0e04754d58c0db";
        hash = "sha256-QVQQUL2yytg0sEDzQAdj3kKsPVD+98c7O/zrkeUB348=";
      };
    };
  });
  meta = {
    description = "Gazebo plugins for building infrastructure simulation";
  };
})
