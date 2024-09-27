{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "nlohmann_json_schema_validator_vendor" = substituteSource {
      src = fetchgit {
        name = "nlohmann_json_schema_validator_vendor-source";
        url = "https://github.com/ros2-gbp/nlohmann_json_schema_validator_vendor-release.git";
        rev = "3123313621d08f1fe6ebd29bca990090a86bbb9c";
        hash = "sha256-2rVkyARMjHb68OEyfUhHWJ7oLGa5hO+/B883YTIPaHM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git";
          to = "URL ${sources."nlohmann_json_schema_validator_vendor/json-schema-validator"}";
        }
      ];
    };
    "nlohmann_json_schema_validator_vendor/json-schema-validator" = substituteSource {
      src = fetchgit {
        name = "json-schema-validator-source";
        url = "https://github.com/pboettch/json-schema-validator.git";
        rev = "5ef4f903af055550e06955973a193e17efded896";
        hash = "sha256-b02OFUx0BxUA6HN6IaacSg1t3RP4o7NND7X0U635W8U=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nlohmann_json_schema_validator_vendor";
  version = "0.5.0-1";
  src = sources."nlohmann_json_schema_validator_vendor";
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
