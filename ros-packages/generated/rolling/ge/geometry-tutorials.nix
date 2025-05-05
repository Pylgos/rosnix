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
  pname = "geometry_tutorials";
  version = "0.6.3-1";
  src = finalAttrs.passthru.sources."geometry_tutorials";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_tutorials" = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "25f63a818f4ffab78daa70fcdbee5e05d3a48653";
        hash = "sha256-XBLuSqrZAESwbGcFHljRtxx8cFqStc8uyUEEwa6fXEM=";
      };
    };
  });
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
})
