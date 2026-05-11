{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_doc";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_doc";
  nativeBuildInputs = [ ament-cmake-ros ];
  buildInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_doc" = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "34eeb2bd33ab3353f27804fab13be66df1191ff0";
        hash = "sha256-Qf5GcDqCJZIhs+axW1Sgb66rt5qzVwWMbvdlqts9LTk=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_doc package provides documentation and examples for the fuse package.\n  ";
  };
})
