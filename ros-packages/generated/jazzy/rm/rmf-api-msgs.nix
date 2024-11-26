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
  pname = "rmf_api_msgs";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."rmf_api_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "python3-jsonschema" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_api_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_api_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_api_msgs-release.git";
        rev = "4418fc3b6cdc5ba308fae642fe43f33cf4953585";
        hash = "sha256-Ak1dhux0ba8ujWuk1C3DYnT66cMNOm8TpfQXwo3I/BQ=";
      };
    };
  });
  meta = {
    description = "RMF API msgs definition";
  };
})
