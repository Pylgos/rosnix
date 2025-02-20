{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-ts-coding,
  etsi-its-cam-ts-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_ts_conversion";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-ts-coding etsi-its-cam-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "96c36c5c0d518491ae5f70507326a77bdbcb7094";
        hash = "sha256-5ell3HGsfFEW3hEe9b+ykUc/QRBqlEISywgU3iDp2+E=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CAMs (TS)";
  };
})
