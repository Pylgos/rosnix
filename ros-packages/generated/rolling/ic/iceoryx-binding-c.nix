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
  version = "2.0.5-5";
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
        rev = "b786ef1c655328235deb93898624923fd00444f9";
        hash = "sha256-MK/r8dSrJHO5SjuOTcRVaAOT5E8CXs0vOCivgRvoAbA=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware C-Language Binding";
  };
})
