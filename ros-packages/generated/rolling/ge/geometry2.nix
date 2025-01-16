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
  version = "0.40.1-1";
  src = finalAttrs.passthru.sources."geometry2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tf2 tf2-bullet tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl tf2-msgs tf2-py tf2-ros tf2-sensor-msgs tf2-tools ];
  passthru.sources = mkSourceSet (sources: {
    "geometry2" = substituteSource {
      src = fetchgit {
        name = "geometry2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "e95e6e1e41c71c2d67335248194acdd554c1d676";
        hash = "sha256-MGlQSh7EeR+RS09p/DppallHQZlpUg6ZdKmO9q9H8Oc=";
      };
    };
  });
  meta = {
    description = "A metapackage to bring in the default packages second generation Transform Library in ros, tf2.";
  };
})
