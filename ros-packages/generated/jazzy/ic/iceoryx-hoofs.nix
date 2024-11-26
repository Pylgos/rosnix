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
  version = "2.0.5-6";
  src = finalAttrs.passthru.sources."iceoryx_hoofs";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "acl" "libatomic" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "iceoryx_hoofs" = substituteSource {
        src = fetchgit {
          name = "iceoryx_hoofs-source";
          url = "https://github.com/ros2-gbp/iceoryx-release.git";
          rev = "2f62692079fe655eb34a51b2c22c2a8555b2a132";
          hash = "sha256-C57YmMV/QQbRaySst8JrcobpnMXYdJ0EFLLY/Zi72ak=";
        };
      };
    });
  };
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware basic building blocks";
  };
})
