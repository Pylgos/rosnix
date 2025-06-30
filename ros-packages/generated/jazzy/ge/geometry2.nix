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
  version = "0.36.12-1";
  src = finalAttrs.passthru.sources."geometry2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ tf2 tf2-bullet tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl tf2-msgs tf2-py tf2-ros tf2-sensor-msgs tf2-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tf2 tf2-bullet tf2-eigen tf2-eigen-kdl tf2-geometry-msgs tf2-kdl tf2-msgs tf2-py tf2-ros tf2-sensor-msgs tf2-tools ];
  passthru.sources = mkSourceSet (sources: {
    "geometry2" = substituteSource {
      src = fetchgit {
        name = "geometry2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "fbdefb0ed177697b14255e4c0ee4eec92e2227f6";
        hash = "sha256-F3FdNP7LJ5bfiH1KmZYerZoRk+KQFYj7i+e7V8DJ3aI=";
      };
    };
  });
  meta = {
    description = "\n    A metapackage to bring in the default packages second generation Transform Library in ros, tf2.\n  ";
  };
})
