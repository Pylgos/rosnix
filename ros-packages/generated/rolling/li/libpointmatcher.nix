{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libnabo,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "libpointmatcher";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."libpointmatcher";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ libnabo ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "yaml-cpp" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ libnabo ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libpointmatcher" = substituteSource {
      src = fetchgit {
        name = "libpointmatcher-source";
        url = "https://github.com/ros2-gbp/libpointmatcher-release.git";
        rev = "23e3db61b290da2cd55b842f885bcaf52b2c7d5a";
        hash = "sha256-7tGaeoTdimWE/QiAy+yt+6cg95i9xFZs4qE7g68hPNc=";
      };
    };
  });
  meta = {
    description = "\n		libpointmatcher is a modular ICP library, useful for robotics and computer vision.\n	";
  };
})
