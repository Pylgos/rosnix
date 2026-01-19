{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kortex_api";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."kortex_api";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "kortex_api" = substituteSource {
      src = fetchgit {
        name = "kortex_api-source";
        url = "https://github.com/ros2-gbp/ros2_kortex-release.git";
        rev = "02f866daa08a4f26696c5f07200f73fb8fa285c4";
        hash = "sha256-S2HGGVpA4cjeYRmxYBdWOJTKYtQGfo/ifXjfWPGzAzc=";
      };
    };
  });
  meta = {
    description = "KINOVA KORTEX™ API";
  };
})
