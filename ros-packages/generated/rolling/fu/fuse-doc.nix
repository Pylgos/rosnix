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
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."fuse_doc";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_doc" = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "e99ece3b479ece78afc8b26bcf54c50c19fdfb17";
        hash = "sha256-HUuIhK/8fwqbWKn9yQOHI6OLJeI15p4Ewvn63PnktyI=";
      };
    };
  });
  meta = {
    description = "The fuse_doc package provides documentation and examples for the fuse package.";
  };
})
