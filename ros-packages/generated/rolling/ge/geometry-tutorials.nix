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
  version = "0.7.0-2";
  src = finalAttrs.passthru.sources."geometry_tutorials";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_tutorials" = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "5a1685ab56125d5c36440f84374523eb65ddce23";
        hash = "sha256-DMb+Rml/KVgftfOAgGzfd/Q6GxGfspsZge5rpadYQnM=";
      };
    };
  });
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
})
