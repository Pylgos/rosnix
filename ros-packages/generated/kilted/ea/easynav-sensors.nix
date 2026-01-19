{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_sensors";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common rclcpp rclcpp-lifecycle sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common rclcpp rclcpp-lifecycle sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common pcl-conversions ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_sensors" = substituteSource {
      src = fetchgit {
        name = "easynav_sensors-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "20f54b8a0c834f26f119e3fc94384e6a57197dfa";
        hash = "sha256-fN0z2TsSHRPeGpkneoxjRGOB/qIQY6rUaPSHEyqZ4yc=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Sensors package.";
  };
})
