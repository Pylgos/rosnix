{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ntpd_driver";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."ntpd_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpoco-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpoco-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ntpd_driver" = substituteSource {
      src = fetchgit {
        name = "ntpd_driver-source";
        url = "https://github.com/ros2-gbp/ntpd_driver-release.git";
        rev = "0c738b994475424362dc73974cf75b2bf087dc74";
        hash = "sha256-huEfbntKtOybpfPBm/ZCLtg1pgZSM4lsVO5KFGWwWEU=";
      };
    };
  });
  meta = {
    description = "ntpd_driver sends TimeReference message time to ntpd server";
  };
})
