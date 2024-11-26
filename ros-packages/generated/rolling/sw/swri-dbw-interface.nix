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
  pname = "swri_dbw_interface";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_dbw_interface";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_dbw_interface" = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "837c510c007b0546895c9004b7a9fe2ffef91205";
        hash = "sha256-sui4AJRXbvUlIwXEiXmtJkOiTx3neUbgobZENVNKvuw=";
      };
    };
  });
  meta = {
    description = "This package provides documentation on common interface conventions for drive-by-wire systems.";
  };
})
