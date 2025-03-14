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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."fuse_doc";
  nativeBuildInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_doc" = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "c658e987d2a36cf49176b6ffe7ba24ef3995dcfd";
        hash = "sha256-F+lncQ7oVAw0daL4HDz2el6pivmtqdBJ6xRM8J9Tqlo=";
      };
    };
  });
  meta = {
    description = "The fuse_doc package provides documentation and examples for the fuse package.";
  };
})
