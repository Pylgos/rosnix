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
  version = "3.7.4-1";
  src = finalAttrs.passthru.sources."swri_dbw_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_dbw_interface" = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "4270a8395309388131dbfb5679630a1c24429c83";
        hash = "sha256-sVD5/F5uiRfPh8z7aAXmw9a1Q0IOnEKDB57rBwViXx4=";
      };
    };
  });
  meta = {
    description = "\n    This package provides documentation on common interface conventions for\n    drive-by-wire systems.\n  ";
  };
})
