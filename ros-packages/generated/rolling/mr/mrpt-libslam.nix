{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libmaps,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libslam";
  version = "2.14.8-1";
  src = finalAttrs.passthru.sources."mrpt_libslam";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake rclcpp ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "pybind11-dev" ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libmaps rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "python3-pip" "tbb" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libslam" = substituteSource {
      src = fetchgit {
        name = "mrpt_libslam-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "dcc0c291ea737550166966f89fe0603df16acf2e";
        hash = "sha256-3ZtCMVG9cFYIkDqk4dkkI2ykbvJY+ye3/ZUomAHt22g=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (slam/vision C++ libraries). This package contains: mrpt-slam, mrpt-vision";
  };
})
