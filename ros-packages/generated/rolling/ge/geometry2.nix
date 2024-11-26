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
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."geometry2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tf2 tf2-bullet tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl tf2-msgs tf2-py tf2-ros tf2-sensor-msgs tf2-tools ];
  passthru = {
    sources = mkSourceSet (sources: {
      "geometry2" = substituteSource {
        src = fetchgit {
          name = "geometry2-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "14c09e07b19b4181b72d25eaf5cc5bd6ef28ae30";
          hash = "sha256-xTegNNuOIwzstnrBwDX8bxU3iibG37C/xXYaVmZKLPI=";
        };
      };
    });
  };
  meta = {
    description = "A metapackage to bring in the default packages second generation Transform Library in ros, tf2.";
  };
})
