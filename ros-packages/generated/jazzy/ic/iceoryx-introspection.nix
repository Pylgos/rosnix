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
  version = "2.0.5-6";
  src = finalAttrs.passthru.sources."iceoryx_introspection";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "iceoryx_introspection" = substituteSource {
      src = fetchgit {
        name = "iceoryx_introspection-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "8fb32f968a3828199e8fbe8086d9eea445d3942a";
        hash = "sha256-CQJ3hBCcrotZK6RXc42VUx+ZWcAJfXVoSQDC3eKzLi4=";
      };
    };
  });
  meta = {
    description = "Eclipse iceoryx inter-process-communication (IPC) middleware introspection client";
  };
})
