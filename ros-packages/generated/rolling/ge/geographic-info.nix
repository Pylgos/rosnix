{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geographic_info";
  version = "1.0.6-2";
  src = finalAttrs.passthru.sources."geographic_info";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geodesy geographic-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geodesy geographic-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "geographic_info" = substituteSource {
      src = fetchgit {
        name = "geographic_info-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "72086208f4a9e990ebb9a8a67242a307f3ee95c7";
        hash = "sha256-9v0PhFwY4GRy9FH7XCYu+48GcNisf9Hg2093eaFWEKU=";
      };
    };
  });
  meta = {
    description = "\n    Geographic information metapackage.\n\n    Not needed for wet packages, use only to resolve dry stack\n    dependencies.\n  ";
  };
})
