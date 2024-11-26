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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_cam_ts_coding" = substituteSource {
        src = fetchgit {
          name = "etsi_its_cam_ts_coding-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "9ac28b8c647465d8e8fd6980c428e907ef3c900d";
          hash = "sha256-10w6RHvlN+/vm72kVcPXGYylGeKG4L4LMpCtIsxGXjw=";
        };
      };
    });
  };
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs (TS) generated from ASN.1 using asn1c";
  };
})
