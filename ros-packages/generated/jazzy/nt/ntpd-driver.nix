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
  version = "2.2.0-4";
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
        rev = "88930151cfd996362a02a17d50c6a727638abe2e";
        hash = "sha256-Y3hISLK0EHzcJD4MrfgxDdmYH+cpgQTjbH3DCmbd0VE=";
      };
    };
  });
  meta = {
    description = "ntpd_driver sends TimeReference message time to ntpd server";
  };
})
