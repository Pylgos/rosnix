{
  ament-cmake-auto,
  ament-lint-auto,
  apex-test-tools,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "test_apex_test_tools";
  version = "0.0.2-9";
  src = finalAttrs.passthru.sources."test_apex_test_tools";
  nativeBuildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto apex-test-tools ];
  passthru = {
    sources = mkSourceSet (sources: {
      "test_apex_test_tools" = substituteSource {
        src = fetchgit {
          name = "test_apex_test_tools-source";
          url = "https://github.com/ros2-gbp/apex_test_tools-release.git";
          rev = "590ff5f45328eaf6331bcda20fc8edd30c7dd1a8";
          hash = "sha256-ZB2lhFknuQ+9fA1s+tCKrhHEUOnSLF2ogSsE0tVMrjE=";
        };
      };
    });
  };
  meta = {
    description = "Test package, which uses things exported by apex_test_tools";
  };
})
