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
  version = "2.1.1-1";
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
        rev = "58d964010d4a344d059bc7455b1853c6c4d4dda0";
        hash = "sha256-rH0hQ0fC64yoa58K8ySA3r4ywzPlIc/U1vSaDf05ECM=";
      };
    };
  });
  meta = {
    description = "Utilities to interface ROS with Beluga.";
  };
})
