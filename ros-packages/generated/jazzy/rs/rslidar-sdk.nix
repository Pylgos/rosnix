{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rslidar-msg,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rslidar_sdk";
  version = "1.5.16-1";
  src = finalAttrs.passthru.sources."rslidar_sdk";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rslidar-msg sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcap" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rslidar-msg sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcap" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rslidar_sdk" = substituteSource {
      src = fetchgit {
        name = "rslidar_sdk-source";
        url = "https://github.com/ros2-gbp/rslidar_sdk-release.git";
        rev = "490b6edae6ef8949c8f9da5a15afc4f578789d18";
        hash = "sha256-15LFlY8eca7zwW2Dr7efTlcOXpIxNCJTC9DmSdY+FhI=";
      };
    };
  });
  meta = {
    description = "The rslidar_sdk package";
  };
})
