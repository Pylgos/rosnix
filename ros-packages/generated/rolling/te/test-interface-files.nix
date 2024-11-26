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
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."test_interface_files";
  nativeBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "test_interface_files" = substituteSource {
      src = fetchgit {
        name = "test_interface_files-source";
        url = "https://github.com/ros2-gbp/test_interface_files-release.git";
        rev = "6d941b72a8a6263cc00a289c938d129fdc2151b5";
        hash = "sha256-1bEeRwPhq17UA3gBMPRTcHBN52UjCDi8I0h/iOYN5b4=";
      };
    };
  });
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
