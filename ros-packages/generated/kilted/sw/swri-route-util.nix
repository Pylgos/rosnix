{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  marti-common-msgs,
  marti-nav-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  swri-geometry-util,
  swri-math-util,
  swri-transform-util,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_route_util";
  version = "3.8.9-1";
  src = finalAttrs.passthru.sources."swri_route_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs marti-common-msgs marti-nav-msgs rclcpp swri-geometry-util swri-math-util swri-transform-util tf2-geometry-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs marti-common-msgs marti-nav-msgs rclcpp swri-geometry-util swri-math-util swri-transform-util tf2-geometry-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "swri_route_util" = substituteSource {
      src = fetchgit {
        name = "swri_route_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "6641d3dadca6cb09267d2571e65bf76afa9f3239";
        hash = "sha256-duOlC19xnjbOWFjJng1/cVZhP1fw13h6M0SfCoMu1o0=";
      };
    };
  });
  meta = {
    description = "\n    This library provides functionality to simplify working with the\n    navigation messages defined in marti_nav_msgs.\n  ";
  };
})
