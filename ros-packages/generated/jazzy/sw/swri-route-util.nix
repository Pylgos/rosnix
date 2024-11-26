{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti-common-msgs,
  marti-nav-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  swri-geometry-util,
  swri-math-util,
  swri-roscpp,
  swri-transform-util,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_route_util";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_route_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ marti-common-msgs marti-nav-msgs rclcpp swri-geometry-util swri-math-util swri-roscpp swri-transform-util tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "swri_route_util" = substituteSource {
        src = fetchgit {
          name = "swri_route_util-source";
          url = "https://github.com/ros2-gbp/marti_common-release.git";
          rev = "20bce421f924f9a3875722f985ebca7f55840fd9";
          hash = "sha256-YxAqGUa1ocmwiqAltTWqsseGPMp3R2hdRa+sIpB6zC0=";
        };
      };
    });
  };
  meta = {
    description = "This library provides functionality to simplify working with the navigation messages defined in marti_nav_msgs.";
  };
})
