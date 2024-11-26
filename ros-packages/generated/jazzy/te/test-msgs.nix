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
  version = "2.0.2-2";
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
          rev = "949ba51a791bdd1fcc9bee93eebad446d617a89d";
          hash = "sha256-7ptSwzU+Pw1ORsW5Zawq4gKz438/XaoJGhvKIYsrwI4=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
