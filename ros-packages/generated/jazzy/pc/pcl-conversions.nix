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
  version = "2.6.2-1";
  src = finalAttrs.passthru.sources."pcl_conversions";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters pcl-msgs rclcpp sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" "libpcl-common" "libpcl-io" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "pcl_conversions" = substituteSource {
      src = fetchgit {
        name = "pcl_conversions-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "469067701f8cc8d3c8f4d60fa114483e6cd3258e";
        hash = "sha256-d2W+lRYtf7BVybVkuNDjs1w8tI2/AxjCrWTgXc4DFkU=";
      };
    };
  });
  meta = {
    description = "Provides conversions from PCL data types and ROS message types";
  };
})
