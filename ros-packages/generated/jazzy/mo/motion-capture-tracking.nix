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
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."motion_capture_tracking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module motion-capture-tracking-interfaces rclcpp sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module motion-capture-tracking-interfaces rclcpp sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libpcl-all-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "motion_capture_tracking" = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "87e8abc534b035dceee17661c768df5e1bb647ff";
        hash = "sha256-CpN7CV55Vq3GgOXcaA7azhmAp7gzHoMDItF+dsmQWQY=";
      };
    };
  });
  meta = {
    description = "ROS Package for different motion capture systems, including custom rigid body tracking support";
  };
})
