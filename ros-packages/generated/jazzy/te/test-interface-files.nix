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
  version = "0.11.0-3";
  src = finalAttrs.passthru.sources."test_interface_files";
  nativeBuildInputs = [ ament-cmake-core ];
  passthru = {
    sources = mkSourceSet (sources: {
      "test_interface_files" = substituteSource {
        src = fetchgit {
          name = "test_interface_files-source";
          url = "https://github.com/ros2-gbp/test_interface_files-release.git";
          rev = "be3978a0de425a0be5cb3530800a3d34f2fe0027";
          hash = "sha256-55oYOWFsjeO86zmwokUyJ+y79la3zhFhSRObMo+Ihj4=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
