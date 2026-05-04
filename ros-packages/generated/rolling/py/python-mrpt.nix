{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libapps,
  mrpt-libgui,
  mrpt-libnav,
  mrpt-libslam,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "python_mrpt";
  version = "2.15.3-2";
  src = finalAttrs.passthru.sources."python_mrpt";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge mrpt-libapps mrpt-libgui mrpt-libnav mrpt-libslam rclcpp ros-environment rosbag2-storage ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge mrpt-libapps mrpt-libgui mrpt-libnav mrpt-libslam rclcpp ros-environment rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "python_mrpt" = substituteSource {
      src = fetchgit {
        name = "python_mrpt-source";
        url = "https://github.com/ros2-gbp/python_mrpt_ros-release.git";
        rev = "23ab72390aa49940cd0dfad787dbd10a416e4db2";
        hash = "sha256-lbFOwBbjHj19YBBZRt/+1hA25QARbeNYKmXP1XepB98=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/MRPT/mrpt.git";
          to = "URL ${sources."python_mrpt/mrpt"}";
        }
      ];
    };
    "python_mrpt/mrpt" = substituteSource {
      src = fetchgit {
        name = "mrpt-source";
        url = "https://github.com/MRPT/mrpt.git";
        rev = "cf8919c59a953d2080bf5f9ae283e4cfb0446a81";
        hash = "sha256-72tcG05RdE0YlFzEQ9vl3j++PUeXOTn1LZ95z4rGatE=";
      };
      substitutions = [
        {
          path = "modules/mrpt_math/cmake/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${sources."python_mrpt/mrpt/eigen-3"}";
        }
        {
          path = "modules/mrpt_obs/cmake/script_tinyxml2.cmake";
          from = "DOWNLOAD\n      https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${sources."python_mrpt/mrpt/tinyxml2-1"}";
        }
        {
          path = "modules/mrpt_obs/cmake/script_tinyxml2.cmake";
          from = "DOWNLOAD\n      https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${sources."python_mrpt/mrpt/tinyxml2-2"}";
        }
      ];
    };
    "python_mrpt/mrpt/eigen-3" = substituteSource {
      src = fetchzip {
        name = "eigen-3-source";
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2";
        hash = "sha256-oXJ4V5rakL9EPtQF0Geptl0HMR8700FdSrOB09DbbMQ=";
      };
    };
    "python_mrpt/mrpt/tinyxml2-1" = substituteSource {
      src = fetchurl {
        name = "tinyxml2-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.cpp";
        hash = "sha256-EMotGRcFLQY9PO9Lle62yoRQNNMBxUoR1ttfAWpKT44=";
      };
    };
    "python_mrpt/mrpt/tinyxml2-2" = substituteSource {
      src = fetchurl {
        name = "tinyxml2-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.h";
        hash = "sha256-C3cg/6R4k8QXqGEc3RKJ7Yd5STPSuiWTTmQt3k2FTQk=";
      };
    };
  });
  meta = {
    description = "Python wrapper for Mobile Robot Programming Toolkit (MRPT) libraries";
  };
})
