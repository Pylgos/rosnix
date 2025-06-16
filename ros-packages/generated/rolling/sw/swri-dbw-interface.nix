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
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."swri_dbw_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_dbw_interface" = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "1b2c80dff35fff24bb8dcd5b0a7b004ab390cda9";
        hash = "sha256-KgtO6mFWObfKh+s08wCCzXU/gSL7FxFK4VM0nDbjCQM=";
      };
    };
  });
  meta = {
    description = "\n    This package provides documentation on common interface conventions for\n    drive-by-wire systems.\n  ";
  };
})
