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
  version = "0.20251106.0-2";
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
        rev = "b4465d219839fa96f69dc23b2825d379434717ef";
        hash = "sha256-UQwPD1gXiaC3MZN21pJ9puWQX1Yq/un6bHZOkL1B/Qg=";
      };
    };
  });
  meta = {
    description = "multimedia RTSP streaming library";
  };
})
