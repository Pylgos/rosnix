{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx-binding-c,
  iceoryx-hoofs,
  iceoryx-posh,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "cyclonedds";
  version = "0.10.5-1";
  src = finalAttrs.passthru.sources."cyclonedds";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ iceoryx-binding-c iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libssl-dev" "openssl" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ iceoryx-binding-c iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "openssl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cyclonedds" = substituteSource {
      src = fetchgit {
        name = "cyclonedds-source";
        url = "https://github.com/ros2-gbp/cyclonedds-release.git";
        rev = "7f10fb21cb022d5f70201931f11f0b97b4d37d1f";
        hash = "sha256-JFn8HlIahFX99o5SBpVkhfap+EIKfLy3mZICNlZNh0o=";
      };
    };
  });
  meta = {
    description = "Eclipse Cyclone DDS is a very performant and robust open-source DDS implementation. Cyclone DDS is developed completely in the open as an Eclipse IoT project.";
  };
})
