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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "52daaca5ac6f8387e7c687f3cd7c063b3412342e";
        hash = "sha256-qTXYfD23RhGrylXMC1Ugm57hHZcvSdR01yIO7jHrWGY=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs (TS) generated from ASN.1 using asn1c";
  };
})
