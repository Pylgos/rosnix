{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-motor-msgs,
  clearpath-platform-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_msgs";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."clearpath_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-motor-msgs clearpath-platform-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "050f86722c716ef67b0048cf5350a191633aae25";
        hash = "sha256-4F8VNrYTV9g15kgEHgxB1inxlBG8/oosQmpnxDX0zgI=";
      };
    };
  });
  meta = {
    description = "Metapackage for Clearapth messages.";
  };
})
