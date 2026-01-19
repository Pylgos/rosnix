{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "fibar_lib";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."fibar_lib";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fibar_lib" = substituteSource {
      src = fetchgit {
        name = "fibar_lib-source";
        url = "https://github.com/ros2-gbp/fibar_lib-release.git";
        rev = "2e274b0bbc673f4c4a8437ce31043f01f03b985c";
        hash = "sha256-W6FsD2qjIw3onOKwOM9jqG5w2YxmGYp64DWZfSV/s28=";
      };
    };
  });
  meta = {
    description = "FIBAR event image reconstruction library";
  };
})
