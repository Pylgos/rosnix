{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libapps,
  mrpt-libnav,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_apps";
  version = "2.15.15-1";
  src = finalAttrs.passthru.sources."mrpt_apps";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake mrpt-libapps mrpt-libnav ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake mrpt-libapps mrpt-libnav ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_apps" = substituteSource {
      src = fetchgit {
        name = "mrpt_apps-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "84a8a0a5fad06079d3f4e9460f0edd88b095aaec";
        hash = "sha256-Fj1xWy57dLLGNOWb+tXo6jlg3ESK+hz0U60kTfW3vJA=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) applications";
  };
})
