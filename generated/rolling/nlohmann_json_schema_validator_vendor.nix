{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    nlohmann_json_schema_validator_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "nlohmann_json_schema_validator_vendor-source";
        owner = "ros2-gbp";
        repo = "nlohmann_json_schema_validator_vendor-release";
        rev = "3123313621d08f1fe6ebd29bca990090a86bbb9c";
        hash = "sha256-2rVkyARMjHb68OEyfUhHWJ7oLGa5hO+/B883YTIPaHM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git";
          to = "URL ${nlohmann_json_schema_validator_vendor-vendor_source-json-schema-validator-0}";
        }
      ];
    };
    nlohmann_json_schema_validator_vendor-vendor_source-json-schema-validator-0 = substituteSource {
      src = fetchFromGitHub {
        name = "nlohmann_json_schema_validator_vendor-vendor_source-json-schema-validator-0-source";
        owner = "pboettch";
        repo = "json-schema-validator";
        rev = "5ef4f903af055550e06955973a193e17efded896";
        hash = "sha256-b02OFUx0BxUA6HN6IaacSg1t3RP4o7NND7X0U635W8U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nlohmann_json_schema_validator_vendor";
  version = "0.5.0-1";
  src = sources.nlohmann_json_schema_validator_vendor;
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
