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
  version = "1.14.0-1";
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
        rev = "7d9f9dc83d754fc27d9b9e27e479ccf191b35233";
        hash = "sha256-TXhLkzBt/m15VJdWkufbAjqaOkiNa3845UOcDmgH3eI=";
      };
    };
  });
  meta = {
    description = "Azure IoT C SDKs and Libraries";
  };
})
