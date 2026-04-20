{
  ament-cmake,
  ament-cmake-gtest,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gps-msgs,
  mkSourceSet,
  mrpt-libmaps,
  mrpt-libobs,
  nav-msgs,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libros_bridge";
  version = "3.5.1-1";
  src = finalAttrs.passthru.sources."mrpt_libros_bridge";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge geometry-msgs gps-msgs mrpt-libmaps mrpt-libobs nav-msgs ros-environment rosbag2-cpp sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge geometry-msgs gps-msgs mrpt-libmaps mrpt-libobs nav-msgs ros-environment rosbag2-cpp sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libros_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros_bridge-release.git";
        rev = "f8efd4d0ba0c4dc21324e1d832942062b1f406c3";
        hash = "sha256-UqDGWzWE1JBYHuntYKa/0HpilBiWFcuWvSqZTFbKnyE=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) ros2bridge C++ library";
  };
})
