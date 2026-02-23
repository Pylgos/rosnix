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
  pname = "mrpt_libtclap";
  version = "2.15.8-1";
  src = finalAttrs.passthru.sources."mrpt_libtclap";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mrpt-libbase ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libbase ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libtclap" = substituteSource {
      src = fetchgit {
        name = "mrpt_libtclap-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "fdce9d5ce919ec34b1c51784064b337f3ee0d910";
        hash = "sha256-5f4DXNSR1A0EygEYg5/4qMOOBHDaS6KavMaOjbap/4c=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (tclap C++ library).\n  This package contains: mrpt-tclap\n  ";
  };
})
