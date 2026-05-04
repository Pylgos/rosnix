{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rc-common-msgs,
  rc-genicam-api,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rc_genicam_driver";
  version = "0.4.0-2";
  src = finalAttrs.passthru.sources."rc_genicam_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-updater image-transport rc-common-msgs rc-genicam-api rclcpp rclcpp-components sensor-msgs stereo-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater image-transport rc-common-msgs rc-genicam-api rclcpp rclcpp-components sensor-msgs stereo-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "rc_genicam_driver" = substituteSource {
      src = fetchgit {
        name = "rc_genicam_driver-source";
        url = "https://github.com/ros2-gbp/rc_genicam_driver_ros2-release.git";
        rev = "d26cd48c57b1ea623f6300fd30b4ed1b6175f982";
        hash = "sha256-LoVcSMyu48SQ/AxcMso1YTMx+jl2VntznfFg2F/dFIU=";
      };
    };
  });
  meta = {
    description = "Driver for rc_visard and rc_cube from Roboception GmbH";
  };
})
