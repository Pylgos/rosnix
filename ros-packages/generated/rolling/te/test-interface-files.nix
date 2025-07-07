{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "test_interface_files";
  version = "0.14.1-1";
  src = finalAttrs.passthru.sources."test_interface_files";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "test_interface_files" = substituteSource {
      src = fetchgit {
        name = "test_interface_files-source";
        url = "https://github.com/ros2-gbp/test_interface_files-release.git";
        rev = "4b177f2e77a61ef524251c29c49981e6ed6be91e";
        hash = "sha256-vGkltWMB0zwInUSqtcGenOMkbmuIaWJ5zjyiTz9CZUk=";
      };
    };
  });
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
