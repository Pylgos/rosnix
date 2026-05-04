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
  version = "3.7.0-2";
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
        rev = "1ad4a0cc1c7250ecc93af2309f804162e8a381cf";
        hash = "sha256-pjGC66bypYyC+Tf6yRoNI8ZCYbV5Czq9vQ8mb8TQEsI=";
      };
    };
  });
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
})
