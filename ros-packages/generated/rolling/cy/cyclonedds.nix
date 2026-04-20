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
  pname = "cyclonedds";
  version = "11.0.1-1";
  src = finalAttrs.passthru.sources."cyclonedds";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libssl-dev" "openssl" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ iceoryx-hoofs iceoryx-posh ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "openssl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cyclonedds" = substituteSource {
      src = fetchgit {
        name = "cyclonedds-source";
        url = "https://github.com/ros2-gbp/cyclonedds-release.git";
        rev = "2f941becbf1b07cc3b0008376356c9fce890dadf";
        hash = "sha256-0V0oprJmoEkHRsGqwEuYWRy5VR43NpZhKyYdWtpVsAI=";
      };
    };
  });
  meta = {
    description = "Eclipse Cyclone DDS is a very performant and robust open-source DDS implementation. Cyclone DDS is developed completely in the open as an Eclipse IoT project.";
  };
})
