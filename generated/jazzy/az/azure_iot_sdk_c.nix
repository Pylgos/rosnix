{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    azure_iot_sdk_c-7d9f9dc83d754fc27d9b9e27e479ccf191b35233 = substituteSource {
      src = fetchgit {
        name = "azure_iot_sdk_c-7d9f9dc83d754fc27d9b9e27e479ccf191b35233-source";
        url = "https://github.com/ros2-gbp/azure_iot_sdk_c-release.git";
        rev = "7d9f9dc83d754fc27d9b9e27e479ccf191b35233";
        hash = "sha256-TXhLkzBt/m15VJdWkufbAjqaOkiNa3845UOcDmgH3eI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "azure_iot_sdk_c";
  version = "1.14.0-1";
  src = sources.azure_iot_sdk_c-7d9f9dc83d754fc27d9b9e27e479ccf191b35233;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libssl-dev" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Azure IoT C SDKs and Libraries";
  };
}
