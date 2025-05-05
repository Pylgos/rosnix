{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-msgs,
  etsi-its-cam-ts-msgs,
  etsi-its-cpm-ts-msgs,
  etsi-its-denm-msgs,
  etsi-its-denm-ts-msgs,
  etsi-its-mapem-ts-msgs,
  etsi-its-spatem-ts-msgs,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-msgs etsi-its-cam-ts-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-denm-ts-msgs etsi-its-mapem-ts-msgs etsi-its-spatem-ts-msgs etsi-its-vam-ts-msgs ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-msgs etsi-its-cam-ts-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-denm-ts-msgs etsi-its-mapem-ts-msgs etsi-its-spatem-ts-msgs etsi-its-vam-ts-msgs ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "85c2d698f107abb94627e41b1a77f3ab0f5c5cce";
        hash = "sha256-3om+D57OFGdHq5ulO3jwyEX7NZvEWNmYlq1lcvacWBk=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS messages";
  };
})
