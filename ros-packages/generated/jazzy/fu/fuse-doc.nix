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
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."fuse_doc";
  nativeBuildInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_doc" = substituteSource {
      src = fetchgit {
        name = "fuse_doc-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "24121e81f24f166c52c66267ea0be8332a1446a5";
        hash = "sha256-uY1vnIJQ0LsiGyvvSWFiqNVyu1/Ag328pzFCn2jhhsQ=";
      };
    };
  });
  meta = {
    description = "The fuse_doc package provides documentation and examples for the fuse package.";
  };
})
