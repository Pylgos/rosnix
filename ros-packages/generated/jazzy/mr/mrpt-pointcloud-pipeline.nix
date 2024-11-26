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
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_pointcloud_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ mp2p-icp mrpt-libgui mrpt-libmaps mrpt-libobs mrpt-libros-bridge nav-msgs rclcpp rclcpp-components sensor-msgs tf2 tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_pointcloud_pipeline" = substituteSource {
      src = fetchgit {
        name = "mrpt_pointcloud_pipeline-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "86e3698cdb4502ad1a7ceeb27f08ac57667c92ba";
        hash = "sha256-hH6KSVz/+YaNavnGjVMvwUFlv8kvWfa65nrsD9cpfuI=";
      };
    };
  });
  meta = {
    description = "Maintains a local obstacle map from recent sensor readings, including optional point cloud pipeline filtering or processing.";
  };
})
