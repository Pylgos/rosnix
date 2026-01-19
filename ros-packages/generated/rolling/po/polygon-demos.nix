{
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  color-util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  polygon-msgs,
  polygon-rviz-plugins,
  polygon-utils,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz2,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_demos";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."polygon_demos";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ angles color-util geometry-msgs polygon-msgs polygon-rviz-plugins polygon-utils rclcpp rviz2 rviz-common rviz-default-plugins ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles color-util geometry-msgs polygon-msgs polygon-rviz-plugins polygon-utils rclcpp rviz2 rviz-common rviz-default-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_demos" = substituteSource {
      src = fetchgit {
        name = "polygon_demos-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "ea91e59eb3f5d4d8d523974884212995a534fcdf";
        hash = "sha256-18o9Po5Ns2LYDCn/UBRfDIRh/wGq30kwUMrvuV6OWwo=";
      };
    };
  });
  meta = {
    description = "Demo of polygon_rviz_plugins";
  };
})
