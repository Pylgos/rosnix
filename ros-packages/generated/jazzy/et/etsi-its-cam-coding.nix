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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "4926cf2a426b008ebfa4566b70370ff7904d0908";
        hash = "sha256-6ws18MIVGaWwxFLQA6A5lcqgBIH4588VfhfjGWrJ8v0=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs generated from ASN.1 using asn1c";
  };
})
