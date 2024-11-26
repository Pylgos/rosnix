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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_cam_coding" = substituteSource {
        src = fetchgit {
          name = "etsi_its_cam_coding-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "8d650bc1c8ce6f0537ea63e82cf1ced01479d283";
          hash = "sha256-/d3zfUvRxHrANNTHAN1jsKTMVWvAxuwP45pU1EJKcvg=";
        };
      };
    });
  };
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs generated from ASN.1 using asn1c";
  };
})
