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
  version = "1.2.3-1";
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
        rev = "c9f34c83e6ac7ebd3716e32be67044611f8d0d8a";
        hash = "sha256-NnU4uri3Dss7G/ZuAiwwy0KeuC0HSYYXIIwuVCeqK78=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_doc package provides documentation and examples for the fuse package.\n  ";
  };
})
