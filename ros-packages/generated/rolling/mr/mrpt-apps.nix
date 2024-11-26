{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libapps,
  mrpt-libnav,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_apps";
  version = "2.14.5-1";
  src = finalAttrs.passthru.sources."mrpt_apps";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ mrpt-libapps mrpt-libnav ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_apps" = substituteSource {
      src = fetchgit {
        name = "mrpt_apps-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "a624b6263d90d3e3abc1436dd843ce1d883e7aeb";
        hash = "sha256-LCztZjy6aJJ2lTzkCjPrnpNFZkggrlhzt3X+JA+yO6U=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) applications";
  };
})
