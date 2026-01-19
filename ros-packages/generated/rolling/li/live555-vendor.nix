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
  version = "0.20251106.0-1";
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
        rev = "66f33417794fd8e80b8ead85be94c58ea922d07a";
        hash = "sha256-UQwPD1gXiaC3MZN21pJ9puWQX1Yq/un6bHZOkL1B/Qg=";
      };
    };
  });
  meta = {
    description = "multimedia RTSP streaming library";
  };
})
