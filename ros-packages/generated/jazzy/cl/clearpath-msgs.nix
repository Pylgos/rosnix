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
  version = "2.6.0-1";
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
        rev = "58f5525fcad8dae2f8e9c1796ce942be74056b0d";
        hash = "sha256-UwO4P/ImnUSGAE7R4ry8CE5EpcZemUEVsAQZIxrlkUo=";
      };
    };
  });
  meta = {
    description = "Metapackage for Clearapth messages.";
  };
})
