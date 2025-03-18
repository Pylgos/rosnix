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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-motor-msgs clearpath-platform-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "0bdf517e5dc1e0379d0d3058a2dc76af66fa4116";
        hash = "sha256-kInnQ1YCJOgWLBVupMQxr65mJGz5NVn0uj9y1aE3oL4=";
      };
    };
  });
  meta = {
    description = "Metapackage for Clearapth messages.";
  };
})
