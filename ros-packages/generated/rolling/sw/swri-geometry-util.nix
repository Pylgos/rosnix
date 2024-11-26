{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_geometry_util";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_geometry_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge rclcpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geos" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "swri_geometry_util" = substituteSource {
        src = fetchgit {
          name = "swri_geometry_util-source";
          url = "https://github.com/ros2-gbp/marti_common-release.git";
          rev = "a5505a50d63255f0a68d1e97f5484a6be3458f1e";
          hash = "sha256-OsZ8EfjkJHo5m2JCUHOv48yGcfGZJFPI9tP485dxmTQ=";
        };
      };
    });
  };
  meta = {
    description = "Commonly used geometry routines, implemented in a ROS friendly package.";
  };
})
