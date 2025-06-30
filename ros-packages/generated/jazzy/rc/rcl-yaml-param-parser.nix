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
  version = "9.2.7-1";
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
        rev = "64c5e82d2e65a01b7fbe312bd078fd841cc36f9c";
        hash = "sha256-rpHw0yBXLxPptu+i977yfgAos/6Z3bh56utV2wTdZtM=";
      };
    };
  });
  meta = {
    description = "Parse a YAML parameter file and populate the C data structure.";
  };
})
