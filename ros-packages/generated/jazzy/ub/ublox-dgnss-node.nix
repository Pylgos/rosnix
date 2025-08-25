{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-uncrustify,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtcm-msgs,
  std-msgs,
  substituteSource,
  ublox-ubx-interfaces,
  ublox-ubx-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_dgnss_node";
  version = "0.6.1-1";
  src = finalAttrs.passthru.sources."ublox_dgnss_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components rtcm-msgs std-msgs ublox-ubx-interfaces ublox-ubx-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libusb-1.0-dev" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components rtcm-msgs std-msgs ublox-ubx-interfaces ublox-ubx-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" "pkg-config" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-uncrustify ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_dgnss_node" = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "3a3e0cab6d67937762411a876067945119a2343e";
        hash = "sha256-pFrMlAxQlFm5lIycjPQDxyZqS9zKiU7YYSD3ZhJAKAc=";
      };
    };
  });
  meta = {
    description = "Provides a ublox_gnss node for a u-blox GPS GNSS receiver using Gen 9 UBX Protocol";
  };
})
