{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pcl-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pcl_conversions";
  version = "2.7.3-1";
  src = finalAttrs.passthru.sources."pcl_conversions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters pcl-msgs rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-io" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters pcl-msgs rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-io" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "pcl_conversions" = substituteSource {
      src = fetchgit {
        name = "pcl_conversions-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "db4536bd0a29b24e431a04a0d804acec0099f271";
        hash = "sha256-PpjBpXEV5DXyZpnSWJm/z8/la8El/6/UHXTucRKmDpQ=";
      };
    };
  });
  meta = {
    description = "Provides conversions from PCL data types and ROS message types";
  };
})
