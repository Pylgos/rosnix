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
  pname = "live555_vendor";
  version = "0.20250719.0-1";
  src = finalAttrs.passthru.sources."live555_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libssl-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "live555_vendor" = substituteSource {
      src = fetchgit {
        name = "live555_vendor-source";
        url = "https://github.com/ros2-gbp/live555_vendor-release.git";
        rev = "d479c2b6ab04f9b054d913e766fbe3e6198e988f";
        hash = "sha256-VBbyr3jUstydtJgiDMzPQVN2fTxO9LJnEVcWudokNsQ=";
      };
    };
  });
  meta = {
    description = "multimedia RTSP streaming library";
  };
})
