{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "iceoryx_hoofs";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."iceoryx_hoofs";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "acl" "libatomic" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "acl" "libatomic" ]; };
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_hoofs" = substituteSource {
      src = fetchgit {
        name = "iceoryx_hoofs-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "e887bb60383c03098d022e900d32056f5d3e124c";
        hash = "sha256-AD4wqzl1ypnN8mhDNey+Mfm6GkZLzdZfa144+iG2Zj4=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware basic building blocks";
  };
})
