{
  buildRosPackage,
  cmake,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  openssl,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    azure_iot_sdk_c = substituteSource {
      src = fetchgit {
        name = "azure_iot_sdk_c-source";
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
  src = sources.azure_iot_sdk_c;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Azure IoT C SDKs and Libraries";
  };
}
