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
  version = "3.2.1-1";
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
        rev = "cb2720c77010fc0bf40f4de9de8b07bb585a688b";
        hash = "sha256-7Yk3Vh9Z5qcwyrqxAkknqYMKI/TfLSh928VH/14L5wQ=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS messages";
  };
})
