{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_ts_coding";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "0706a0209827438eb89ade6b660265bf72074ed5";
        hash = "sha256-nNHW8tb0PK7oZBrMRpUO6Ob2nnYEAsY+CTQiRiW1psI=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs (TS) generated from ASN.1 using asn1c";
  };
})
