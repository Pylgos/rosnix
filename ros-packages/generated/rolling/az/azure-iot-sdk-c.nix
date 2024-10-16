{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "azure_iot_sdk_c" = substituteSource {
      src = fetchgit {
        name = "azure_iot_sdk_c-source";
        url = "https://github.com/ros2-gbp/azure_iot_sdk_c-release.git";
        rev = "b08c4fbb256b9438813e8c86c42512e330eb18f5";
        hash = "sha256-zGeKBP8LXVA/vOI7EHJ8q6AZ/d2YyMv5VGdvVlaFzCI=";
      };
      substitutions = [
      ];
    };
  });
in
buildCmakePackage (finalAttrs: {
  pname = "azure_iot_sdk_c";
  version = "1.14.0-1";
  src = finalAttrs.passthru.sources."azure_iot_sdk_c";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Azure IoT C SDKs and Libraries";
  };
})
