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
  version = "3.7.5-1";
  src = finalAttrs.passthru.sources."swri_route_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ marti-common-msgs marti-nav-msgs rclcpp swri-geometry-util swri-math-util swri-roscpp swri-transform-util tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ marti-common-msgs marti-nav-msgs rclcpp swri-geometry-util swri-math-util swri-roscpp swri-transform-util tf2-geometry-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_route_util" = substituteSource {
      src = fetchgit {
        name = "swri_route_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "4ea03be1399ee9a857a137dba37ee494e0f54d9b";
        hash = "sha256-ceffFI2DvrPzseaVITVeh+4vmhj90ExjVWFm3HR79NI=";
      };
    };
  });
  meta = {
    description = "\n    This library provides functionality to simplify working with the\n    navigation messages defined in marti_nav_msgs.\n  ";
  };
})
