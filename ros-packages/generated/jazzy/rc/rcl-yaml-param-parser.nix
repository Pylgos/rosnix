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
  version = "9.2.4-1";
  src = finalAttrs.passthru.sources."rcl_yaml_param_parser";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ];
  propagatedBuildInputs = [ libyaml-vendor rcutils rmw ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rcl_yaml_param_parser" = substituteSource {
        src = fetchgit {
          name = "rcl_yaml_param_parser-source";
          url = "https://github.com/ros2-gbp/rcl-release.git";
          rev = "879fb6a89c95676bcad0efba2c2113bb76c619ed";
          hash = "sha256-0AfdVsztTLjHUTLy8u6TneHKLCS2xZaGck3YaHRd3Xg=";
        };
      };
    });
  };
  meta = {
    description = "Parse a YAML parameter file and populate the C data structure.";
  };
})
