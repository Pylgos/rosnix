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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_demos";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."polygon_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ angles color-util geometry-msgs polygon-msgs polygon-rviz-plugins polygon-utils rviz2 rviz-common rviz-default-plugins ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_demos" = substituteSource {
      src = fetchgit {
        name = "polygon_demos-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "86332f324e1462f7e9b442b86b1a7d5fccfba2f5";
        hash = "sha256-dDYoqHETJwUGUuaTq4wRqUEFxtJqi5NvThKJpPwHV/s=";
      };
    };
  });
  meta = {
    description = "Demo of polygon_rviz_plugins";
  };
})
