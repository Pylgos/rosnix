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
  propagatedBuildInputs = [ iceoryx-hoofs iceoryx-posh ];
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_binding_c" = substituteSource {
      src = fetchgit {
        name = "iceoryx_binding_c-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "6237cfaf326c4f4c7f52ec205cfc875e77a27dcf";
        hash = "sha256-UqcNskP7JPfAKSicnC6JTnghNDZ8bDM0sCiiajhqit4=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware C-Language Binding";
  };
})
