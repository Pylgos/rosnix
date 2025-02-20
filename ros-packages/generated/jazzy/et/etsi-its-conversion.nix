{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-conversion,
  etsi-its-cam-ts-conversion,
  etsi-its-cpm-ts-conversion,
  etsi-its-denm-conversion,
  etsi-its-denm-ts-conversion,
  etsi-its-mapem-ts-conversion,
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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-conversion etsi-its-cam-ts-conversion etsi-its-cpm-ts-conversion etsi-its-denm-conversion etsi-its-denm-ts-conversion etsi-its-mapem-ts-conversion etsi-its-spatem-ts-conversion etsi-its-vam-ts-conversion rclcpp rclcpp-components std-msgs udp-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "8e68a6616a6d79ddae62972c5a0196e309cd7411";
        hash = "sha256-AibKpVpiiit2pA573ijUkVY05o2z6egebgDXUkO0Hbk=";
      };
    };
  });
  meta = {
    description = "Converts ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
})
