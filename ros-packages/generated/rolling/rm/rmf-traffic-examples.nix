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
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."rmf_traffic_examples";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-traffic ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_traffic_examples" = substituteSource {
        src = fetchgit {
          name = "rmf_traffic_examples-source";
          url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
          rev = "50b6ef2d854e46b63e2d744562e2b325aff8417f";
          hash = "sha256-IM5mfeZru7UofVMMsk1bSVYMz0EhbkkpSNRXKJMD8p4=";
        };
      };
    });
  };
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
})
