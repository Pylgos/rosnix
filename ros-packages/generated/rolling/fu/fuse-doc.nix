{
  ament-cmake,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_doc";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."fuse_doc";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_doc" = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "431f08e0c7feda9aff67aa480ed0071ca068c4a5";
        hash = "sha256-Xj2cItl5EtWJq1jAp5Ak5XP2gnMUIiOMcIW037YtM4s=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_doc package provides documentation and examples for the fuse package.\n  ";
  };
})
