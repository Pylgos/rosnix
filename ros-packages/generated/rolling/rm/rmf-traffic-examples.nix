{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-traffic,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_traffic_examples";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_examples";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ rmf-traffic ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-traffic ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_examples" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_examples-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "e6c63ecd527d860a45610eb7fa60dd6e69582def";
        hash = "sha256-W37WidDfH6kYVv9wKbQ31tOcN+jCQ4aYjpNgEWfAxZ0=";
      };
    };
  });
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
})
