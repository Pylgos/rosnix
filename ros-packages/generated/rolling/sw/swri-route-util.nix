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
  version = "3.7.4-1";
  src = finalAttrs.passthru.sources."swri_route_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ marti-common-msgs marti-nav-msgs swri-geometry-util swri-math-util swri-roscpp swri-transform-util tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_route_util" = substituteSource {
      src = fetchgit {
        name = "swri_route_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "4ee996e1f8cc661b788b202351d61db3e0f1ef74";
        hash = "sha256-n42jnwzx9VrzeaOvOhDpmBu9VshZv6Iocw//8W0ao2c=";
      };
    };
  });
  meta = {
    description = "This library provides functionality to simplify working with the navigation messages defined in marti_nav_msgs.";
  };
})
