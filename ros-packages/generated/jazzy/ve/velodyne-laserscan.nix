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
  version = "2.5.1-1";
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
        rev = "7e1bc2d54a3612ae27f46cff0dc825d86b91d606";
        hash = "sha256-vxfBGHebyJrP5lJ7zXMLbVg/eMBRkghsPg4URP19K9k=";
      };
    };
  });
  meta = {
    description = "\n    Extract a single ring of a Velodyne PointCloud2 and publish it as a LaserScan message\n  ";
  };
})
