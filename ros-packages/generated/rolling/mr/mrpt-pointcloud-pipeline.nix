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
  mp2p-icp,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libobs,
  mrpt-libros-bridge,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_pointcloud_pipeline";
  version = "2.2.2-1";
  src = finalAttrs.passthru.sources."mrpt_pointcloud_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mp2p-icp mrpt-libgui mrpt-libmaps mrpt-libobs mrpt-libros-bridge nav-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mp2p-icp mrpt-libgui mrpt-libmaps mrpt-libobs mrpt-libros-bridge nav-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_pointcloud_pipeline" = substituteSource {
      src = fetchgit {
        name = "mrpt_pointcloud_pipeline-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "615e79d053734bd6c828e9bf7702a72afdd2e0c4";
        hash = "sha256-Pvz+8031FAZ1sMhIqj7NtTMXsLqU0YpKnlHGYsCGlT8=";
      };
    };
  });
  meta = {
    description = "Maintains a local obstacle map from recent sensor readings, including optional point cloud pipeline filtering or processing.";
  };
})
