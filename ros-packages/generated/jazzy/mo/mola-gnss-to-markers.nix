{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
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
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."mola_gnss_to_markers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mrpt-libobs mrpt-nav-interfaces rclcpp std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mrpt-libobs mrpt-nav-interfaces rclcpp std-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "mola_gnss_to_markers" = substituteSource {
      src = fetchgit {
        name = "mola_gnss_to_markers-source";
        url = "https://github.com/ros2-gbp/mola_gnss_to_markers-release.git";
        rev = "7d66b8820ee06c48c4144d34372d943959235e5f";
        hash = "sha256-Kr5chlkHXOBITeUciaCMyddDX4Nxf7WKtyy47MwMzu8=";
      };
    };
  });
  meta = {
    description = "Takes GNSS (GPS) readings, a MOLA georeferenced map, and publishes markers to visualize the datums as ellipsoids on the map";
  };
})
