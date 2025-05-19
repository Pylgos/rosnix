{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-conversion,
  etsi-its-cam-ts-conversion,
  etsi-its-cpm-ts-conversion,
  etsi-its-denm-conversion,
  etsi-its-denm-ts-conversion,
  etsi-its-mapem-ts-conversion,
  etsi-its-mcm-uulm-conversion,
  etsi-its-spatem-ts-conversion,
  etsi-its-vam-ts-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  udp-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_conversion";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-denm-ts-conversion etsi-its-mapem-ts-conversion etsi-its-mcm-uulm-conversion etsi-its-spatem-ts-conversion etsi-its-vam-ts-conversion rclcpp rclcpp-components ros-environment std-msgs udp-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-denm-ts-conversion etsi-its-mapem-ts-conversion etsi-its-mcm-uulm-conversion etsi-its-spatem-ts-conversion etsi-its-vam-ts-conversion rclcpp rclcpp-components ros-environment std-msgs udp-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "eda507e2b296d2b8329e41a1ab7100b39ba3644a";
        hash = "sha256-268Zg/xY4V7n9a577OSJuJ1meY74R3sCq/JYCCsHNl4=";
      };
    };
  });
  meta = {
    description = "Converts ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
})
