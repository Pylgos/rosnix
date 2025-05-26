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
  version = "3.7.6-1";
  src = finalAttrs.passthru.sources."swri_dbw_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_dbw_interface" = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "d026fcaa638d4e8014504dceaf97c7d987dcfea3";
        hash = "sha256-rDeRmNW9SMgDm7nfjGtB2y8KnjuAlVmZUvuUF8gNeQk=";
      };
    };
  });
  meta = {
    description = "\n    This package provides documentation on common interface conventions for\n    drive-by-wire systems.\n  ";
  };
})
