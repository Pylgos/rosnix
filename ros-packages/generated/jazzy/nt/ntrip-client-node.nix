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
  libcurl-vendor,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtcm-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ntrip_client_node";
  version = "0.6.1-1";
  src = finalAttrs.passthru.sources."ntrip_client_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ libcurl-vendor rclcpp rclcpp-components rtcm-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ libcurl-vendor rclcpp rclcpp-components rtcm-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-uncrustify ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ntrip_client_node" = substituteSource {
      src = fetchgit {
        name = "ntrip_client_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "ef878f7ed3a76ee7ec07f82f038bb2ed6e19fc3d";
        hash = "sha256-bgrx0klGfGGDKTECdXECKZR+rRO7TAoneDcbIaWrwfc=";
      };
    };
  });
  meta = {
    description = "Publishes RTCM ntrip messages from an external mountpoint";
  };
})
