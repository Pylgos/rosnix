{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libbase,
  mrpt-libmath,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libposes";
  version = "2.15.2-1";
  src = finalAttrs.passthru.sources."mrpt_libposes";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mrpt-libbase mrpt-libmath ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libbase mrpt-libmath ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libposes" = substituteSource {
      src = fetchgit {
        name = "mrpt_libposes-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "9cac32316eb6cfa6d987e7cf0585e034a2e26bca";
        hash = "sha256-OqLQlswy4ge39P3OAJPnjP2TAnR6RXr99ML1GDs9PRw=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (poses C++ libraries).\n  This package contains: mrpt-poses, mrpt-tfest, mrpt-bayes\n  ";
  };
})
