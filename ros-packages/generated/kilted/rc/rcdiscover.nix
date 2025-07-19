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
  pname = "rcdiscover";
  version = "1.1.7-2";
  src = finalAttrs.passthru.sources."rcdiscover";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcdiscover" = substituteSource {
      src = fetchgit {
        name = "rcdiscover-source";
        url = "https://github.com/ros2-gbp/rcdiscover-release.git";
        rev = "d98c6f0a1a6e0038c51f39f611dede71791dfbaf";
        hash = "sha256-leXJVw7Yx8SeMv0jUFtQmpFCpDaJkvd7U6AqjpdLEOE=";
      };
    };
  });
  meta = {
    description = "\n        This package contains tools for the discovery of Roboception devices via GigE Vision.\n    ";
  };
})
