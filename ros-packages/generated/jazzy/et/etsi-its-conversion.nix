{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-conversion,
  etsi-its-cam-ts-conversion,
  etsi-its-conversion-srvs,
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
  substituteSource,
  udp-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_conversion";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-conversion-srvs etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-denm-ts-conversion etsi-its-mapem-ts-conversion etsi-its-mcm-uulm-conversion etsi-its-spatem-ts-conversion etsi-its-vam-ts-conversion rclcpp rclcpp-components ros-environment udp-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-conversion-srvs etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-denm-ts-conversion etsi-its-mapem-ts-conversion etsi-its-mcm-uulm-conversion etsi-its-spatem-ts-conversion etsi-its-vam-ts-conversion rclcpp rclcpp-components ros-environment udp-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "36d4084c906b1cd0fe9b22cbd27a76f80a5bc644";
        hash = "sha256-0CN+X7aet1BYZoARDdvFQSSsrqA4K1q7L4GHVBm4lFE=";
      };
    };
  });
  meta = {
    description = "Converts ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
})
