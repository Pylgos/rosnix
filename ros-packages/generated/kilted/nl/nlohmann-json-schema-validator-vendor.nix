{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nlohmann_json_schema_validator_vendor";
  version = "0.5.0-2";
  src = finalAttrs.passthru.sources."nlohmann_json_schema_validator_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nlohmann_json_schema_validator_vendor" = substituteSource {
      src = fetchgit {
        name = "nlohmann_json_schema_validator_vendor-source";
        url = "https://github.com/ros2-gbp/nlohmann_json_schema_validator_vendor-release.git";
        rev = "fa30c0a523b93cdbee225b4a65b8df1b8ea452f5";
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
    };
  });
  meta = {
    description = "A vendor package for JSON schema validator for JSON for Modern C++";
  };
})
