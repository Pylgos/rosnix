{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libobs,
  mrpt-nav-interfaces,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_gnss_to_markers";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."mola_gnss_to_markers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mrpt-libobs mrpt-nav-interfaces rclcpp std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mrpt-libobs mrpt-nav-interfaces rclcpp std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mola_gnss_to_markers" = substituteSource {
      src = fetchgit {
        name = "mola_gnss_to_markers-source";
        url = "https://github.com/ros2-gbp/mola_gnss_to_markers-release.git";
        rev = "7d75b103010696a7ff468f644c34b08b409a9e46";
        hash = "sha256-rxCHj2oWiGll6dTqQN5iIcyzKK0GMpU5iR/ZhdBM+Yk=";
      };
    };
  });
  meta = {
    description = "Takes GNSS (GPS) readings, a MOLA georeferenced map, and publishes markers to visualize the datums as ellipsoids on the map";
  };
})
