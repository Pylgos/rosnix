{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    json-schema-validator-vendor_source-5ef4f903af055550e06955973a193e17efded896 = substituteSource {
      src = fetchgit {
        name = "json-schema-validator-vendor_source-5ef4f903af055550e06955973a193e17efded896-source";
        url = "https://github.com/pboettch/json-schema-validator.git";
        rev = "5ef4f903af055550e06955973a193e17efded896";
        hash = "sha256-b02OFUx0BxUA6HN6IaacSg1t3RP4o7NND7X0U635W8U=";
      };
      substitutions = [
      ];
    };
    nlohmann_json_schema_validator_vendor-df4a8c1ea35981d6d29738b8415db11f55e501ef = substituteSource {
      src = fetchgit {
        name = "nlohmann_json_schema_validator_vendor-df4a8c1ea35981d6d29738b8415db11f55e501ef-source";
        url = "https://github.com/ros2-gbp/nlohmann_json_schema_validator_vendor-release.git";
        rev = "df4a8c1ea35981d6d29738b8415db11f55e501ef";
        hash = "sha256-pBIRF/MRTDv02vSUyB5ADB9Huv00MrRRhBElaBHa4ro=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git";
          to = "URL ${json-schema-validator-vendor_source-5ef4f903af055550e06955973a193e17efded896}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "nlohmann_json_schema_validator_vendor";
  version = "0.4.1-1";
  src = sources.nlohmann_json_schema_validator_vendor-df4a8c1ea35981d6d29738b8415db11f55e501ef;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A vendor package for JSON schema validator for JSON for Modern C++";
  };
}
