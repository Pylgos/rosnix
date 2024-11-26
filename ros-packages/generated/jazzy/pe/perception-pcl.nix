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
  version = "2.6.2-1";
  src = finalAttrs.passthru.sources."perception_pcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ];
  passthru = {
    sources = mkSourceSet (sources: {
      "perception_pcl" = substituteSource {
        src = fetchgit {
          name = "perception_pcl-source";
          url = "https://github.com/ros2-gbp/perception_pcl-release.git";
          rev = "dffbf37d2e3ac6dd31d2c9e8b7e7591c6bb3347e";
          hash = "sha256-bBmHIHH2Ic0r/71bht2jdqPLUUY9mCpMkJK5yspGf14=";
        };
      };
    });
  };
  meta = {
    description = "PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred bridge for 3D applications involving n-D Point Clouds and 3D geometry processing in ROS.";
  };
})
