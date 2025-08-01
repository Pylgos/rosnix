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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rmf_api_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "python3-jinja2" "python3-jsonschema" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "python3-jinja2" "python3-jsonschema" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_api_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_api_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_api_msgs-release.git";
        rev = "7760d78d6ba378e705c755789ce1fd59fb90a29e";
        hash = "sha256-ZrQEkdK3U9mIdIV7l3IjL+Q4+DNUXD8DBhjNYYVovqg=";
      };
    };
  });
  meta = {
    description = "RMF API msgs definition";
  };
})
