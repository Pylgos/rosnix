{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  motion-capture-tracking-interfaces,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "motion_capture_tracking";
  version = "1.0.3-3";
  src = finalAttrs.passthru.sources."motion_capture_tracking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ motion-capture-tracking-interfaces sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "motion_capture_tracking" = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "42bccb83df2d4181678a85d158baf5f9a996a3fe";
        hash = "sha256-i4x1fFnItmyr13Kz2YfUYfYKcessV15UqBvrOb4Q41c=";
      };
    };
  });
  meta = {
    description = "ROS Package for different motion capture systems, including custom rigid body tracking support";
  };
})
