{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libapps,
  mrpt_libgui,
  mrpt_libnav,
  mrpt_libslam,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  substituteSource,
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
    hunter-RapidJSON-1_0_2-p2 = substituteSource {
      src = fetchzip {
        name = "hunter-RapidJSON-1_0_2-p2-source";
        url = "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz";
        hash = "sha256-EjeojFq4D+yFEKW4U1v4n8Naay5LfmLbEfKJVaV5aTM=";
      };
      substitutions = [
      ];
    };
    hunter-RapidJSON-1_1_0-b557259-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-RapidJSON-1_1_0-b557259-p0-source";
        url = "https://github.com/cpp-pm/rapidjson/archive/refs/tags/v1.1.0-b557259-p0.tar.gz";
        hash = "sha256-H/8dtXY5GXRzCocIvnoX0LWaKHTfqdWe/j53yy60tAw=";
      };
      substitutions = [
      ];
    };
    hunter-ZLIB-1_2_13-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_13-p0-source";
        url = "https://github.com/cpp-pm/zlib/archive/v1.2.13-p0.tar.gz";
        hash = "sha256-Yyem8Rj9T+C6M3XJi3J1AEC2K5g4+mzcoFZWgF9AuZU=";
      };
      substitutions = [
      ];
    };
    hunter-ZLIB-1_2_8-p3 = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_8-p3-source";
        url = "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz";
        hash = "sha256-KwMG0+z2gFWLCY1vuIf9dZR5NrEDpl8earBxWHeYJzE=";
      };
      substitutions = [
      ];
    };
    hunter-draco-1_4_1-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-draco-1_4_1-p0-source";
        url = "https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz";
        hash = "sha256-Usmf4z24/fsezZQU7EzCqDY4ug1fXXK1+ekGKYSR1RU=";
      };
      substitutions = [
      ];
    };
    hunter-minizip-1_0_1-p1 = substituteSource {
      src = fetchzip {
        name = "hunter-minizip-1_0_1-p1-source";
        url = "https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz";
        hash = "sha256-EIkfHFynpxRQF/gkLB6H70+wPqiM/lGHySJtlnYQ7eQ=";
      };
      substitutions = [
      ];
    };
    hunter-minizip-1_0_1-p3 = substituteSource {
      src = fetchzip {
        name = "hunter-minizip-1_0_1-p3-source";
        url = "https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz";
        hash = "sha256-99uujp3c7NXQgyHSPDs22PnNyV0IR0WBhivIEmuej1E=";
      };
      substitutions = [
      ];
    };
    hunter-openddlparser-0_1_0-p2 = substituteSource {
      src = fetchzip {
        name = "hunter-openddlparser-0_1_0-p2-source";
        url = "https://github.com/hunter-packages/openddl-parser/archive/v0.1.0-p2.tar.gz";
        hash = "sha256-O4u04uf00hf60dmhWHU3ph3Tlw0dBLyjTSRcU0mwehk=";
      };
      substitutions = [
      ];
    };
    hunter-pugixml-1_10-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-pugixml-1_10-p0-source";
        url = "https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz";
        hash = "sha256-2F3RnpY6oqnSvIlsb8ohkezQebvSlJNLiGCAMOeWkdI=";
      };
      substitutions = [
      ];
    };
    hunter-stb-0_0_0-80c8f6a-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-stb-0_0_0-80c8f6a-p0-source";
        url = "https://github.com/cpp-pm/stb/archive/refs/tags/v0.0.0-80c8f6a-p0.tar.gz";
        hash = "sha256-vZ4uzOP2PK/QA6Wu6Pw5zLrcbE0GRcZYqxfnj15EFck=";
      };
      substitutions = [
      ];
    };
    hunter-utf8-3_1_1 = substituteSource {
      src = fetchzip {
        name = "hunter-utf8-3_1_1-source";
        url = "https://github.com/nemtrif/utfcpp/archive/v3.1.1.tar.gz";
        hash = "sha256-zDlRpBbpFbdAKd2Y+HP3JVf9bF9advpJrRr2egRNt7Q=";
      };
      substitutions = [
      ];
    };
    hunter-zip-0_1_15 = substituteSource {
      src = fetchzip {
        name = "hunter-zip-0_1_15-source";
        url = "https://github.com/kuba--/zip/archive/v0.1.15.tar.gz";
        hash = "sha256-BGzqiYqDqC2y8NkURsCf5OKepw5J26Ql0bQGZsaUdb8=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-gamecontrollerdb-8 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source-gamecontrollerdb-8-source";
        url = "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt";
        hash = "sha256-cew4QVQyrpJFH0IP0QTbfKjRFtE15oCShhiBEzRJ+S0=";
      };
      substitutions = [
      ];
    };
    python_mrpt = substituteSource {
      src = fetchgit {
        name = "python_mrpt-source";
        url = "https://github.com/ros2-gbp/python_mrpt_ros-release.git";
        rev = "7dd81301179d76e87147eae87f833d901c4d56ec";
        hash = "sha256-R6aITSw0Q0mhOqYrfsz2G0B/KqBOofxD9E+jIs6ArDE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/MRPT/mrpt.git";
          to = "URL ${python_mrpt-vendor_source-mrpt-0}";
        }
      ];
    };
    python_mrpt-vendor_source-mrpt-0 = substituteSource {
      src = fetchgit {
        name = "python_mrpt-vendor_source-mrpt-0-source";
        url = "https://github.com/MRPT/mrpt.git";
        rev = "fb7ec66611dcac2d3263a1ec7018fdbb1902f716";
        hash = "sha256-Qy24bQYoUIl6+X6sdgUu8DjJolDlpFufgLTSld1btBY=";
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
          to = "URL ${python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0}";
        }
        {
          path = "cmakemodules/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${python_mrpt-vendor_source-mrpt-0-vendor_source-eigen-3-13}";
        }
        {
          path = "cmakemodules/script_jpeg.cmake";
          from = "URL               \"https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz\"";
          to = "URL ${python_mrpt-vendor_source-mrpt-0-vendor_source-1-14}";
        }
        {
          path = "cmakemodules/script_octomap.cmake";
          from = "URL               \"\${OCTOMAP_EP_URL}\"";
          to = "URL ${python_mrpt-vendor_source-mrpt-0-vendor_source-v1-15}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${python_mrpt-vendor_source-mrpt-0-vendor_source-tinyxml2-16}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${python_mrpt-vendor_source-mrpt-0-vendor_source-tinyxml2-16}";
        }
      ];
    };
    python_mrpt-vendor_source-mrpt-0-vendor_source-1-14 = substituteSource {
      src = fetchzip {
        name = "python_mrpt-vendor_source-mrpt-0-vendor_source-1-14-source";
        url = "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz";
        hash = "sha256-yw8qGdNf35VrplhI+Sq2xNuwk78Ld6wkF6IVF5V8nKQ=";
      };
      substitutions = [
      ];
    };
    python_mrpt-vendor_source-mrpt-0-vendor_source-eigen-3-13 = substituteSource {
      src = fetchzip {
        name = "python_mrpt-vendor_source-mrpt-0-vendor_source-eigen-3-13-source";
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
    python_mrpt-vendor_source-mrpt-0-vendor_source-tinyxml2-16 = substituteSource {
      src = fetchurl {
        name = "python_mrpt-vendor_source-mrpt-0-vendor_source-tinyxml2-16-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.h";
        hash = "sha256-C3cg/6R4k8QXqGEc3RKJ7Yd5STPSuiWTTmQt3k2FTQk=";
      };
      substitutions = [
      ];
    };
    python_mrpt-vendor_source-mrpt-0-vendor_source-v1-15 = substituteSource {
      src = fetchzip {
        name = "python_mrpt-vendor_source-mrpt-0-vendor_source-v1-15-source";
        url = "https://github.com/OctoMap/octomap/archive/v1.9.6.zip";
        hash = "sha256-4KxVe1Ffu6GUmIY+SH/CHxRsy+phEOHqdxco51ogYw8=";
      };
      substitutions = [
      ];
    };
    python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0 = substituteSource {
      src = fetchzip {
        name = "python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0-source";
        url = "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz";
        hash = "sha256-/1A8n7oe9WsF3FpbLZxhifzrdj38t9l5Kc8Q5jfDoyY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.24.18.tar.gz\"";
          to = "URL ${python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0-vendor_source-v0-0}";
        }
      ];
    };
    python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0-vendor_source-v0-0 = substituteSource {
      src = fetchzip {
        name = "python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0-vendor_source-v0-0-source";
        url = "https://github.com/cpp-pm/hunter/archive/v0.24.18.tar.gz";
        hash = "sha256-i0VZDjsUalB3ZwAfGVY2RGEECYBTExS3yux9KDruETE=";
      };
      substitutions = [
        {
          path = "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in";
          from = ". \"@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh\" && ";
          to = "";
        }
        {
          path = "cmake/projects/RapidJSON/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/rapidjson/archive/refs/tags/v1.1.0-b557259-p0.tar.gz\"";
          to = "URL ${hunter-RapidJSON-1_1_0-b557259-p0}";
        }
        {
          path = "cmake/projects/RapidJSON/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz\"";
          to = "URL ${hunter-RapidJSON-1_0_2-p2}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/zlib/archive/v1.2.13-p0.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_2_13-p0}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_2_8-p3}";
        }
        {
          path = "cmake/projects/draco/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz\"";
          to = "URL ${hunter-draco-1_4_1-p0}";
        }
        {
          path = "cmake/projects/minizip/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz\"";
          to = "URL ${hunter-minizip-1_0_1-p1}";
        }
        {
          path = "cmake/projects/minizip/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz\"";
          to = "URL ${hunter-minizip-1_0_1-p3}";
        }
        {
          path = "cmake/projects/openddlparser/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/openddl-parser/archive/v0.1.0-p2.tar.gz\"";
          to = "URL ${hunter-openddlparser-0_1_0-p2}";
        }
        {
          path = "cmake/projects/pugixml/hunter.cmake";
          from = "URL \"https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz\"";
          to = "URL ${hunter-pugixml-1_10-p0}";
        }
        {
          path = "cmake/projects/stb/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/stb/archive/refs/tags/v0.0.0-80c8f6a-p0.tar.gz\"";
          to = "URL ${hunter-stb-0_0_0-80c8f6a-p0}";
        }
        {
          path = "cmake/projects/utf8/hunter.cmake";
          from = "URL\n    \"https://github.com/nemtrif/utfcpp/archive/v3.1.1.tar.gz\"";
          to = "URL ${hunter-utf8-3_1_1}";
        }
        {
          path = "cmake/projects/zip/hunter.cmake";
          from = "URL\n    \"https://github.com/kuba--/zip/archive/v0.1.15.tar.gz\"";
          to = "URL ${hunter-zip-0_1_15}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "python_mrpt";
  version = "2.14.0-1";
  src = sources.python_mrpt;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mrpt_libapps mrpt_libgui mrpt_libnav mrpt_libslam rclcpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python wrapper for Mobile Robot Programming Toolkit (MRPT) libraries";
  };
}