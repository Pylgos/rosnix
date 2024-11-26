{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-python,
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
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."beluga_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ beluga geometry-msgs nav-msgs sensor-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-h5py" "python3-matplotlib" "python3-scipy" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "beluga_ros" = substituteSource {
      src = fetchgit {
        name = "beluga_ros-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "2ce8e69bfddd01c5c394c9b23c499a4a6f18ce55";
        hash = "sha256-4RnTLzRcla3M7v/bkXIxVunsAemyZVO4lcW3K5gSeUA=";
      };
    };
  });
  meta = {
    description = "Utilities to interface ROS with Beluga.";
  };
})
