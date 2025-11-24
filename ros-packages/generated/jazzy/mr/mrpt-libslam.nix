{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libmaps,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libslam";
  version = "2.15.2-1";
  src = finalAttrs.passthru.sources."mrpt_libslam";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mrpt-libmaps ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tbb" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libmaps ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tbb" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libslam" = substituteSource {
      src = fetchgit {
        name = "mrpt_libslam-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "f0c98ae6024eb2f2762fc962260196132f6cd4ec";
        hash = "sha256-J48cylF/Osj6N6rq87jv2FMe5EXC5hMOlyl+EnDzSOI=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (slam/vision C++ libraries).\n  This package contains: mrpt-slam, mrpt-vision\n  ";
  };
})
