{
  ament_cmake,
  assimp,
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  freeglut,
  freenect,
  geometry_msgs,
  glfw3,
  libGL,
  libGLU,
  libjpeg,
  libpcap,
  libusb1,
  mrpt_libmaps,
  nav_msgs,
  opencv,
  pkg-config,
  python3Packages,
  rclcpp,
  ros_environment,
  rosbag2_storage,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tinyxml-2,
  udev,
  wxGTK32,
  xorg,
  zlib,
}:
let
  sources = rec {
    gtsam-vendor_source-lapack_addons_3-0 = substituteSource {
      src = fetchurl {
        name = "gtsam-vendor_source-lapack_addons_3-0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-gamecontrollerdb-8 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source-gamecontrollerdb-8-source";
        url = "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt";
        hash = "sha256-5ByqbhZIkSoHIqXvvWF8gi30RY0oAmbmqgERLkIWajU=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-1-1 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-1-1-source";
        url = "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz";
        hash = "sha256-yw8qGdNf35VrplhI+Sq2xNuwk78Ld6wkF6IVF5V8nKQ=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-v1-0 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-v1-0-source";
        url = "https://github.com/OctoMap/octomap/archive/v1.9.6.zip";
        hash = "sha256-4KxVe1Ffu6GUmIY+SH/CHxRsy+phEOHqdxco51ogYw8=";
      };
      substitutions = [
      ];
    };
    mrpt2-vendor_source-v5-2 = substituteSource {
      src = fetchzip {
        name = "mrpt2-vendor_source-v5-2-source";
        url = "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz";
        hash = "sha256-/1A8n7oe9WsF3FpbLZxhifzrdj38t9l5Kc8Q5jfDoyY=";
      };
      substitutions = [
      ];
    };
    mrpt_apps-vendor_source-mrpt-0 = substituteSource {
      src = fetchgit {
        name = "mrpt_apps-vendor_source-mrpt-0-source";
        url = "https://github.com/MRPT/mrpt.git";
        rev = "10191145bb725d3f9ebae846ed39c92dfc024a3b";
        hash = "sha256-bYc1HlBjYMO+TL7l7sfQpTqojTXWWPYbXD0wQIG9nEs=";
      };
      substitutions = [
        {
          path = "3rdparty/nanogui/ext/glfw/CMake/GenerateMappings.cmake";
          from = "DOWNLOAD \"\${source_url}\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source-gamecontrollerdb-8}";
        }
        {
          path = "cmakemodules/script_assimp.cmake";
          from = "URL               \"https://github.com/assimp/assimp/archive/v5.3.1.tar.gz\"";
          to = "URL ${mrpt2-vendor_source-v5-2}";
        }
        {
          path = "cmakemodules/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${mrpt_apps-vendor_source-mrpt-0-vendor_source-eigen-3-15}";
        }
        {
          path = "cmakemodules/script_jpeg.cmake";
          from = "URL               \"https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz\"";
          to = "URL ${mrpt2-vendor_source-1-1}";
        }
        {
          path = "cmakemodules/script_octomap.cmake";
          from = "URL               \"\${OCTOMAP_EP_URL}\"";
          to = "URL ${mrpt2-vendor_source-v1-0}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${mrpt_apps-vendor_source-mrpt-0-vendor_source-tinyxml2-16}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${mrpt_apps-vendor_source-mrpt-0-vendor_source-tinyxml2-16}";
        }
      ];
    };
    mrpt_apps-vendor_source-mrpt-0-vendor_source-eigen-3-15 = substituteSource {
      src = fetchzip {
        name = "mrpt_apps-vendor_source-mrpt-0-vendor_source-eigen-3-15-source";
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2";
        hash = "sha256-oXJ4V5rakL9EPtQF0Geptl0HMR8700FdSrOB09DbbMQ=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${gtsam-vendor_source-lapack_addons_3-0}";
        }
      ];
    };
    mrpt_apps-vendor_source-mrpt-0-vendor_source-tinyxml2-16 = substituteSource {
      src = fetchurl {
        name = "mrpt_apps-vendor_source-mrpt-0-vendor_source-tinyxml2-16-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.h";
        hash = "sha256-C3cg/6R4k8QXqGEc3RKJ7Yd5STPSuiWTTmQt3k2FTQk=";
      };
      substitutions = [
      ];
    };
    mrpt_libros_bridge = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "bffafcfd35d8e17e65265851f4ccfda11f8c370a";
        hash = "sha256-2SYMW1oGCVLS1A+26a334Yan3NVdlbDOGa0Qkrkj0Mw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/MRPT/mrpt.git";
          to = "URL ${mrpt_apps-vendor_source-mrpt-0}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libros_bridge";
  version = "2.13.7-2";
  src = sources.mrpt_libros_bridge;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge ffmpeg freeglut freenect geometry_msgs glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libmaps nav_msgs opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage sensor_msgs std_msgs stereo_msgs tf2 tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (ros2bridge C++ library). This package contains: mrpt-ros2bridge";
  };
}
