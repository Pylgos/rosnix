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
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libros_bridge";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."mrpt_libros_bridge";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge geometry-msgs gps-msgs mrpt-libmaps mrpt-libobs nav-msgs ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge geometry-msgs gps-msgs mrpt-libmaps mrpt-libobs nav-msgs ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libros_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros_bridge-release.git";
        rev = "b7fabadf15db71e69decdfe09b134ce1e132a6a1";
        hash = "sha256-D9FJDX3M9OZshJsH4b65t7gFJFj3emPN0UMx1pT1JSU=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) ros2bridge C++ library";
  };
})
