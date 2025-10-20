{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_cam_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "11975658e30a3d42c73d5c8fb946361869477078";
        hash = "sha256-Xr5vvt/8NpeT4zFoyZIJ6Pr8MBoYBRy7DQO9ubV8xRY=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs generated from ASN.1 using asn1c";
  };
})
