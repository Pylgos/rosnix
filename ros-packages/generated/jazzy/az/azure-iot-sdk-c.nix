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
        rev = "62e68ed8fb537446af3b5409257cd47f66c1807a";
        hash = "sha256-TXhLkzBt/m15VJdWkufbAjqaOkiNa3845UOcDmgH3eI=";
      };
    };
  });
  meta = {
    description = "Azure IoT C SDKs and Libraries";
  };
})
