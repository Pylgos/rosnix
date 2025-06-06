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
  version = "0.1.0-1";
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
        rev = "0f9034125328a7fba5855918ea94e4eaf8b06b84";
        hash = "sha256-UXcqe/oU/nyRKhsCAO7XaSqGidwiNUosrR9A8VdNMuw=";
      };
    };
  });
  meta = {
    description = "Takes GNSS (GPS) readings, a MOLA georeferenced map, and publishes markers to visualize the datums as ellipsoids on the map";
  };
})
