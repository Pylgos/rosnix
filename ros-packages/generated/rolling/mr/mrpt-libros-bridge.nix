{
  ament-cmake,
  ament-cmake-gtest,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
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
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."mrpt_libros_bridge";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge geometry-msgs mrpt-libmaps mrpt-libobs nav-msgs ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge geometry-msgs mrpt-libmaps mrpt-libobs nav-msgs ros-environment sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libros_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros_bridge-release.git";
        rev = "32bb62175106fc7a88d4be734cca6679b8f46fb5";
        hash = "sha256-Fp2kwt7tLr2KYDGRuW5f9cOAG/ALQIxjgcHTxx0g5vc=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) ros2bridge C++ library";
  };
})
