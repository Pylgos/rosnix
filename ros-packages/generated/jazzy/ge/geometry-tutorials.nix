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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."geometry_tutorials";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_tutorials" = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "41254d9691294b2097eb42a77f57209cf3b0329a";
        hash = "sha256-hUMh0tFMH1FtZeYHlz7Wkncd8L1/y8oODx+QYd54pls=";
      };
    };
  });
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
})
