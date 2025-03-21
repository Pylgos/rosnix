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
        rev = "b6f466ad9de2050db032b9f389b7fe366fb61b1c";
        hash = "sha256-sui4AJRXbvUlIwXEiXmtJkOiTx3neUbgobZENVNKvuw=";
      };
    };
  });
  meta = {
    description = "This package provides documentation on common interface conventions for drive-by-wire systems.";
  };
})
