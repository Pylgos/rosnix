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
  version = "0.20250917.0-1";
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
        rev = "4eac39e4ae88fcc8acce02812a4008578f23d7a9";
        hash = "sha256-Ij7zo7/Wp0EfOxDyeWSbpjBzMsZN262TgHuIwEb8m8c=";
      };
    };
  });
  meta = {
    description = "multimedia RTSP streaming library";
  };
})
