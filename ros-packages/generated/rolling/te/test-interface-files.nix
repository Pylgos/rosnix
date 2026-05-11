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
  version = "0.15.0-1";
  src = finalAttrs.passthru.sources."test_interface_files";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "test_interface_files" = substituteSource {
      src = fetchgit {
        name = "test_interface_files-source";
        url = "https://github.com/ros2-gbp/test_interface_files-release.git";
        rev = "f8f94da3c6d9f8d8d675b0de82c693f0e8e2864c";
        hash = "sha256-L9JnTOhQyApRpGPUdO/RsKNLHCo7gyqeOyfppMQl+eo=";
      };
    };
  });
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
