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
  pname = "etsi_its_cam_coding";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "07e99adffdf369eb10a5e3116932f2ac30bc550c";
        hash = "sha256-C5Qwj6J7niWxP+FV2LGunwiMKUogtWPy7xGwwxkK3rc=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs generated from ASN.1 using asn1c";
  };
})
