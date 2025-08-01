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
  sensor-msgs,
  std-msgs,
  substituteSource,
  ublox-ubx-interfaces,
  ublox-ubx-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_nav_sat_fix_hp_node";
  version = "0.5.7-1";
  src = finalAttrs.passthru.sources."ublox_nav_sat_fix_hp_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-msgs ublox-ubx-interfaces ublox-ubx-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs std-msgs ublox-ubx-interfaces ublox-ubx-msgs ];
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-uncrustify ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ublox_nav_sat_fix_hp_node" = substituteSource {
      src = fetchgit {
        name = "ublox_nav_sat_fix_hp_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "8981cdd143b5d2e4c503b3ae5463f0cc03edfabb";
        hash = "sha256-FwBD8XvHB1t/We48VMc33s8yraA0nueQmf6mOc8yzqU=";
      };
    };
  });
  meta = {
    description = "Provides a NavSatFix node for a u-blox GPS GNSS receiver using Gen 9 UBX Protocol";
  };
})
