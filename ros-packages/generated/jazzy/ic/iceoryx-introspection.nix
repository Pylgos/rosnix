{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx-hoofs,
  iceoryx-posh,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "iceoryx_introspection";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."iceoryx_introspection";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libncurses-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_introspection" = substituteSource {
      src = fetchgit {
        name = "iceoryx_introspection-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "4917f9b5656f260fb9eae93e6976fa5061aef01a";
        hash = "sha256-BSHTMaIpwlMHFLM25geUcX1pFMrDNdm81kEZ1Xapfbg=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware introspection client";
  };
})
