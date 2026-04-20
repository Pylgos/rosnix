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
  version = "10.4.3-1";
  src = finalAttrs.passthru.sources."rcl_yaml_param_parser";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedNativeBuildInputs = [ libyaml-vendor rcutils rmw ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml" ]; };
  buildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ libyaml-vendor rcutils rmw ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_yaml_param_parser" = substituteSource {
      src = fetchgit {
        name = "rcl_yaml_param_parser-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "5075a870ac02a0ff9ed4c2245d04d92311b66b19";
        hash = "sha256-PBgJwHZiRZrP0xXrnAAV4UKNOTnxK7/hYI92B10pJqQ=";
      };
    };
  });
  meta = {
    description = "Parse a YAML parameter file and populate the C data structure.";
  };
})
