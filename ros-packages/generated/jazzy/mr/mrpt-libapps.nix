{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libgui,
  mrpt-libhwdrivers,
  mrpt-libmaps,
  mrpt-libslam,
  mrpt-libtclap,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libapps";
  version = "2.15.15-1";
  src = finalAttrs.passthru.sources."mrpt_libapps";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mrpt-libgui mrpt-libhwdrivers mrpt-libmaps mrpt-libslam mrpt-libtclap ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libgui mrpt-libhwdrivers mrpt-libmaps mrpt-libslam mrpt-libtclap ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libapps" = substituteSource {
      src = fetchgit {
        name = "mrpt_libapps-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "4b6d1369a752a9927cd8dc998c798292e519e17e";
        hash = "sha256-D8eHwWGBetzGExofbDX9rZbeWFVFilGB2WrsfVLm4Us=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (apps C++ libraries).\n  This package contains: mrpt-apps lib, mrpt-graphslam\n  ";
  };
})
