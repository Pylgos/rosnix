{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "velodyne_laserscan";
  version = "2.5.1-2";
  src = finalAttrs.passthru.sources."velodyne_laserscan";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "velodyne_laserscan" = substituteSource {
      src = fetchgit {
        name = "velodyne_laserscan-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "62a6b550581cf0712aec85744f98be5fd41f589a";
        hash = "sha256-vxfBGHebyJrP5lJ7zXMLbVg/eMBRkghsPg4URP19K9k=";
      };
    };
  });
  meta = {
    description = "\n    Extract a single ring of a Velodyne PointCloud2 and publish it as a LaserScan message\n  ";
  };
})
