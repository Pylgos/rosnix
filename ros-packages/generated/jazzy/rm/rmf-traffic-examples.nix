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
  version = "3.3.3-1";
  src = finalAttrs.passthru.sources."rmf_traffic_examples";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ rmf-traffic ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_examples" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_examples-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "850ece6b823d78a9939f9e0652a032199d365779";
        hash = "sha256-pMdBb9M0tdombzn0B22IYQRO6zA6tQIhQii8pN+8XiI=";
      };
    };
  });
  meta = {
    description = "Examples of how to use the rmf_traffic library";
  };
})
