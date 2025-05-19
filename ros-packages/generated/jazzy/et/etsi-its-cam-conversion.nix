{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-coding,
  etsi-its-cam-msgs,
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
  pname = "etsi_its_cam_conversion";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cam-coding etsi-its-cam-msgs etsi-its-primitives-conversion ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cam-coding etsi-its-cam-msgs etsi-its-primitives-conversion ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "a934cbdaea8008d41facff32c152a95de74ef8f0";
        hash = "sha256-RucrvTcDEl+7p8bQtpMpvGAAMKE4kLwjfE/CKRyrAuU=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CAMs";
  };
})
