{
  buildAmentCmakePackage,
  etsi-its-cam-msgs,
  etsi-its-cam-ts-msgs,
  etsi-its-cpm-ts-msgs,
  etsi-its-denm-msgs,
  etsi-its-denm-ts-msgs,
  etsi-its-mapem-ts-msgs,
  etsi-its-mcm-uulm-msgs,
  etsi-its-spatem-ts-msgs,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  udp-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_conversion_srvs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_conversion_srvs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ etsi-its-cam-msgs etsi-its-cam-ts-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-denm-ts-msgs etsi-its-mapem-ts-msgs etsi-its-mcm-uulm-msgs etsi-its-spatem-ts-msgs etsi-its-vam-ts-msgs rosidl-default-runtime udp-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ etsi-its-cam-msgs etsi-its-cam-ts-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-denm-ts-msgs etsi-its-mapem-ts-msgs etsi-its-mcm-uulm-msgs etsi-its-spatem-ts-msgs etsi-its-vam-ts-msgs rosidl-default-runtime udp-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_conversion_srvs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_conversion_srvs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "34dff644a901f5fb2e75dbb9001f800307b8719a";
        hash = "sha256-rGBv0GKyTVrz42oSbvpFbswjbWzIyZu1dx4brhm9mkI=";
      };
    };
  });
  meta = {
    description = "Services to convert ROS messages to and from ASN.1-encoded ETSI ITS messages";
  };
})
