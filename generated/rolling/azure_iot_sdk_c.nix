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
        rev = "b08c4fbb256b9438813e8c86c42512e330eb18f5";
        hash = "sha256-zGeKBP8LXVA/vOI7EHJ8q6AZ/d2YyMv5VGdvVlaFzCI=";
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
