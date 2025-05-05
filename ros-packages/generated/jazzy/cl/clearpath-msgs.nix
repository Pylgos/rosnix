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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."clearpath_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ clearpath-motor-msgs clearpath-platform-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-motor-msgs clearpath-platform-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "eb219ba40e6225d3c54e4696d7ff073a10726313";
        hash = "sha256-G0Ul8UqlUTxG0t0opw4OM526JeqDpJg8S1JG+u21XJc=";
      };
    };
  });
  meta = {
    description = "Metapackage for Clearapth messages.";
  };
})
