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
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."geographic_info";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geodesy geographic-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "geographic_info" = substituteSource {
      src = fetchgit {
        name = "geographic_info-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "d383a93b5b352857206ef02b4826a1ef3b2a3e96";
        hash = "sha256-9v0PhFwY4GRy9FH7XCYu+48GcNisf9Hg2093eaFWEKU=";
      };
    };
  });
  meta = {
    description = "Geographic information metapackage. Not needed for wet packages, use only to resolve dry stack dependencies.";
  };
})
