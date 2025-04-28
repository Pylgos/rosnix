{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-bullet,
  tf2-eigen,
  tf2-eigen-kdl,
  tf2-geometry-msgs,
  tf2-kdl,
  tf2-msgs,
  tf2-py,
  tf2-ros,
  tf2-sensor-msgs,
  tf2-tools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geometry2";
  version = "0.36.10-1";
  src = finalAttrs.passthru.sources."geometry2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tf2 tf2-bullet tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl tf2-msgs tf2-py tf2-ros tf2-sensor-msgs tf2-tools ];
  passthru.sources = mkSourceSet (sources: {
    "geometry2" = substituteSource {
      src = fetchgit {
        name = "geometry2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "412c00c098968c925e6580e7633e00c7c245bbc2";
        hash = "sha256-Na1p1pTjURJGcFy+dgUGZORFsgDgJxBq4vAPbpmJrB4=";
      };
    };
  });
  meta = {
    description = "A metapackage to bring in the default packages second generation Transform Library in ros, tf2.";
  };
})
