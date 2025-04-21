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
  passthru.sources = mkSourceSet (sources: {
    "swri_dbw_interface" = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "3fc0a261ce219ab1d30baad3ac507a3aa7788fd5";
        hash = "sha256-sVD5/F5uiRfPh8z7aAXmw9a1Q0IOnEKDB57rBwViXx4=";
      };
    };
  });
  meta = {
    description = "This package provides documentation on common interface conventions for drive-by-wire systems.";
  };
})
