{
  ament-cmake,
  ament-cmake-python,
  ament-cmake-ros,
  beluga,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "beluga_ros";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."beluga_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ beluga geometry-msgs nav-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ beluga geometry-msgs nav-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "beluga_ros" = substituteSource {
      src = fetchgit {
        name = "beluga_ros-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "6b212c0abcfc313cc1b5c450d89d65fe0efd7ae8";
        hash = "sha256-fOQuOXnwJTBmmZB2p8526K/hhzgNNMQM4rFD14/YslU=";
      };
    };
  });
  meta = {
    description = "Utilities to interface ROS with Beluga.";
  };
})
