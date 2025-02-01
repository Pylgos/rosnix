{
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyaml-vendor,
  mimick-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  performance-test-fixture,
  rcutils,
  rmw,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcl_yaml_param_parser";
  version = "10.0.2-1";
  src = finalAttrs.passthru.sources."rcl_yaml_param_parser";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ libyaml-vendor rcutils rmw ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_yaml_param_parser" = substituteSource {
      src = fetchgit {
        name = "rcl_yaml_param_parser-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "94a5937fbfe160495478f8a1fab5eb31049541c3";
        hash = "sha256-nkmZL70in+EWFFAy+l7/MwLnp1TxNzn7QxJCMb613LU=";
      };
    };
  });
  meta = {
    description = "Parse a YAML parameter file and populate the C data structure.";
  };
})
