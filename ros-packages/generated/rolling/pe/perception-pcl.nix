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
  version = "2.7.2-1";
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
        rev = "a8cfd711f0bc640155f491a41e17cc13f0706d50";
        hash = "sha256-zQF6qw+rgsR9frlNUHYu9wLSLSpmMLG1jcoIJi3uhEI=";
      };
    };
  });
  meta = {
    description = "\n  PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred\n  bridge for 3D applications involving n-D Point Clouds and 3D geometry\n  processing in ROS.\n  ";
  };
})
