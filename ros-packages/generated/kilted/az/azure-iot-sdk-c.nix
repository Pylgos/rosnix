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
  pname = "azure_iot_sdk_c";
  version = "1.14.0-2";
  src = finalAttrs.passthru.sources."azure_iot_sdk_c";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" "libssl-dev" "uuid" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "curl" "libssl-dev" "uuid" ]; };
  passthru.sources = mkSourceSet (sources: {
    "azure_iot_sdk_c" = substituteSource {
      src = fetchgit {
        name = "azure_iot_sdk_c-source";
        url = "https://github.com/ros2-gbp/azure_iot_sdk_c-release.git";
        rev = "20343351ade19080fc81cb9160d6d2ae004e82a0";
        hash = "sha256-zGeKBP8LXVA/vOI7EHJ8q6AZ/d2YyMv5VGdvVlaFzCI=";
      };
    };
  });
  meta = {
    description = "Azure IoT C SDKs and Libraries";
  };
})
