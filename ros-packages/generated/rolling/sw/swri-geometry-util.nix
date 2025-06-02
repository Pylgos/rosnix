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
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."swri_geometry_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ cv-bridge rclcpp tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geos" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge rclcpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geos" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "swri_geometry_util" = substituteSource {
      src = fetchgit {
        name = "swri_geometry_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "70ca4a1db59cade1e2a65f894d0d233d2af2d168";
        hash = "sha256-6s1022ngL0RxUw+Piun+EZkCDr5o/EDzevnXtnjkWwo=";
      };
    };
  });
  meta = {
    description = "\n    Commonly used geometry routines, implemented in a ROS friendly package.\n  ";
  };
})
