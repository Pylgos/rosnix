{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libbase,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libmath";
  version = "2.15.11-1";
  src = finalAttrs.passthru.sources."mrpt_libmath";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mrpt-libbase ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libbase ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libmath" = substituteSource {
      src = fetchgit {
        name = "mrpt_libmath-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "1e5f6290b03cafd0f15ef9cf005719c93f82abe6";
        hash = "sha256-fg0qC+BGPTtmHYsaiscqjMh+touWoOEezafXiZCW84w=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (math C++ libraries).\n  This package contains: mrpt-math\n  ";
  };
})
