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
  pname = "iceoryx_binding_c";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."iceoryx_binding_c";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ iceoryx-hoofs iceoryx-posh ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ iceoryx-hoofs iceoryx-posh ];
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_binding_c" = substituteSource {
      src = fetchgit {
        name = "iceoryx_binding_c-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "5fce790143d8ece31178fe3dfde6dbb50b1f9999";
        hash = "sha256-Ft8eQOk+FEbpxCS2MErg3iX/9u5lfqtmtUACWtfUE3k=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware C-Language Binding";
  };
})
