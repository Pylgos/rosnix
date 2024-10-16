{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  mkSourceSet,
  nav-msgs,
  novatel-gps-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  swri-math-util,
  swri-roscpp,
  swri-serial-util,
  tf2,
  tf2-geometry-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "novatel_gps_driver" = substituteSource {
      src = fetchgit {
        name = "novatel_gps_driver-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "ba8842b4e47e05cfccbdca9b7c1f2c1698ec1af3";
        hash = "sha256-vdcYwUolZmKLnlDwWfWCMc2ndQTtmceSjVNyU+rp3Vw=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "novatel_gps_driver";
  version = "4.1.3-1";
  src = finalAttrs.passthru.sources."novatel_gps_driver";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater gps-msgs nav-msgs novatel-gps-msgs rclcpp rclcpp-components sensor-msgs std-msgs swri-math-util swri-roscpp swri-serial-util tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libpcap" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Driver for NovAtel receivers";
  };
})
