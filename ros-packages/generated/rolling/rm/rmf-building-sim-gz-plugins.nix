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
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."rmf_building_sim_gz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ gz-gui-vendor gz-msgs-vendor gz-plugin-vendor gz-rendering-vendor gz-sim-vendor gz-transport-vendor menge-vendor rclcpp rmf-door-msgs rmf-fleet-msgs rmf-lift-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_building_sim_gz_plugins" = substituteSource {
        src = fetchgit {
          name = "rmf_building_sim_gz_plugins-source";
          url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
          rev = "6ce450a3c292b4e9b659417d175babbd30addb1e";
          hash = "sha256-fzdbcl/ilmj9BDRBKwzwe3c2JFK+w0acoYG6Fq+rkgI=";
        };
      };
    });
  };
  meta = {
    description = "Gazebo plugins for building infrastructure simulation";
  };
})
