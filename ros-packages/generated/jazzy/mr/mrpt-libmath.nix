{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libbase,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libmath";
  version = "2.14.5-1";
  src = finalAttrs.passthru.sources."mrpt_libmath";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libbase rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_libmath" = substituteSource {
        src = fetchgit {
          name = "mrpt_libmath-source";
          url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
          rev = "ee37de1623ff5a65eb2e4bd6bdacb71844d571a4";
          hash = "sha256-k19RYpuyQmM97F9z1ZUPPvV6gFSqDAgeVbRxnAC751M=";
        };
      };
    });
  };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (math C++ libraries). This package contains: mrpt-math";
  };
})
