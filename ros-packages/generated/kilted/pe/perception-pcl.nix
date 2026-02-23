{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pcl-msgs,
  pcl-ros,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "perception_pcl";
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."perception_pcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ];
  passthru.sources = mkSourceSet (sources: {
    "perception_pcl" = substituteSource {
      src = fetchgit {
        name = "perception_pcl-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "88a68ebf278de1e5f8565f154c6a7c52917e9e20";
        hash = "sha256-JmI2MqwBOEAUL8/4T1QuAh3nmiJDtKt2OwvKSxL/848=";
      };
    };
  });
  meta = {
    description = "\n  PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred\n  bridge for 3D applications involving n-D Point Clouds and 3D geometry\n  processing in ROS.\n  ";
  };
})
