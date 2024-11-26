{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  test-interface-files,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "test_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime test-interface-files ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "test_msgs" = substituteSource {
        src = fetchgit {
          name = "test_msgs-source";
          url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
          rev = "243133eade9f4c62910ae3f73e47cfd6d8dc4ef1";
          hash = "sha256-ZPfkWltGHjaGtM/X7GCw9+cEgLLNY85dCvcXLwMkFxg=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
