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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-denm-ts-conversion etsi-its-mapem-ts-conversion etsi-its-mcm-uulm-conversion etsi-its-spatem-ts-conversion etsi-its-vam-ts-conversion rclcpp-components std-msgs udp-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "4484ac667bd8f4d6a5c242155fa2e1c7138b6ad4";
        hash = "sha256-5aCjKLtMrS8J/kgZisJYZL5MaBaDOOqTUNG4tazU4W0=";
      };
    };
  });
  meta = {
    description = "Converts ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
})
