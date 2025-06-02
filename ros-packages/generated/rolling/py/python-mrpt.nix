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
  version = "2.14.9-1";
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
        rev = "09c0c010aea4a3d41390d5398470aab1ddc1b9cf";
        hash = "sha256-4ZJi5vMtIK8OJdOxLme8M5HgHPFc5EMwkJAihzBPB/s=";
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
        rev = "482d21f33b5748c6dbb6eb1a0ec9dfca489b6c2f";
        hash = "sha256-Z7L7dBqQaRpMdPrLDnt4x2efEsEBwIERSQVzUS4KK3I=";
      };
      substitutions = [
        {
          path = "cmakemodules/script_assimp.cmake";
          from = "URL               \"https://github.com/assimp/assimp/archive/v5.3.1.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5"}";
        }
        {
          path = "cmakemodules/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${sources."python_mrpt/mrpt/eigen-3"}";
        }
        {
          path = "cmakemodules/script_jpeg.cmake";
          from = "URL               \"https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/1"}";
        }
        {
          path = "cmakemodules/script_octomap.cmake";
          from = "URL               \"\${OCTOMAP_EP_URL}\"";
          to = "URL ${sources."python_mrpt/mrpt/v1"}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${sources."python_mrpt/mrpt/tinyxml2-1"}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${sources."python_mrpt/mrpt/tinyxml2-2"}";
        }
      ];
    };
    "python_mrpt/mrpt/1" = substituteSource {
      src = fetchzip {
        name = "1-source";
        url = "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz";
        hash = "sha256-yw8qGdNf35VrplhI+Sq2xNuwk78Ld6wkF6IVF5V8nKQ=";
      };
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
    "python_mrpt/mrpt/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/OctoMap/octomap/archive/v1.9.6.zip";
        hash = "sha256-4KxVe1Ffu6GUmIY+SH/CHxRsy+phEOHqdxco51ogYw8=";
      };
    };
    "python_mrpt/mrpt/v5" = substituteSource {
      src = fetchzip {
        name = "v5-source";
        url = "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz";
        hash = "sha256-/1A8n7oe9WsF3FpbLZxhifzrdj38t9l5Kc8Q5jfDoyY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.24.18.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0"}";
        }
      ];
    };
    "python_mrpt/mrpt/v5/v0" = substituteSource {
      src = fetchzip {
        name = "v0-source";
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
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-RapidJSON-1_1_0-b557259-p0"}";
        }
        {
          path = "cmake/projects/RapidJSON/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-RapidJSON-1_0_2-p2"}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/zlib/archive/v1.2.13-p0.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-ZLIB-1_2_13-p0"}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-ZLIB-1_2_8-p3"}";
        }
        {
          path = "cmake/projects/draco/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-draco-1_4_1-p0"}";
        }
        {
          path = "cmake/projects/minizip/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-minizip-1_0_1-p1"}";
        }
        {
          path = "cmake/projects/minizip/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-minizip-1_0_1-p3"}";
        }
        {
          path = "cmake/projects/openddlparser/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/openddl-parser/archive/v0.1.0-p2.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-openddlparser-0_1_0-p2"}";
        }
        {
          path = "cmake/projects/pugixml/hunter.cmake";
          from = "URL \"https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-pugixml-1_10-p0"}";
        }
        {
          path = "cmake/projects/stb/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/stb/archive/refs/tags/v0.0.0-80c8f6a-p0.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-stb-0_0_0-80c8f6a-p0"}";
        }
        {
          path = "cmake/projects/utf8/hunter.cmake";
          from = "URL\n    \"https://github.com/nemtrif/utfcpp/archive/v3.1.1.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-utf8-3_1_1"}";
        }
        {
          path = "cmake/projects/zip/hunter.cmake";
          from = "URL\n    \"https://github.com/kuba--/zip/archive/v0.1.15.tar.gz\"";
          to = "URL ${sources."python_mrpt/mrpt/v5/v0/hunter-zip-0_1_15"}";
        }
      ];
    };
    "python_mrpt/mrpt/v5/v0/hunter-RapidJSON-1_0_2-p2" = substituteSource {
      src = fetchzip {
        name = "hunter-RapidJSON-1_0_2-p2-source";
        url = "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz";
        hash = "sha256-EjeojFq4D+yFEKW4U1v4n8Naay5LfmLbEfKJVaV5aTM=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-RapidJSON-1_1_0-b557259-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-RapidJSON-1_1_0-b557259-p0-source";
        url = "https://github.com/cpp-pm/rapidjson/archive/refs/tags/v1.1.0-b557259-p0.tar.gz";
        hash = "sha256-H/8dtXY5GXRzCocIvnoX0LWaKHTfqdWe/j53yy60tAw=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-ZLIB-1_2_13-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_13-p0-source";
        url = "https://github.com/cpp-pm/zlib/archive/v1.2.13-p0.tar.gz";
        hash = "sha256-Yyem8Rj9T+C6M3XJi3J1AEC2K5g4+mzcoFZWgF9AuZU=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-ZLIB-1_2_8-p3" = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_8-p3-source";
        url = "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz";
        hash = "sha256-KwMG0+z2gFWLCY1vuIf9dZR5NrEDpl8earBxWHeYJzE=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-draco-1_4_1-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-draco-1_4_1-p0-source";
        url = "https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz";
        hash = "sha256-Usmf4z24/fsezZQU7EzCqDY4ug1fXXK1+ekGKYSR1RU=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-minizip-1_0_1-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-minizip-1_0_1-p1-source";
        url = "https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz";
        hash = "sha256-EIkfHFynpxRQF/gkLB6H70+wPqiM/lGHySJtlnYQ7eQ=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-minizip-1_0_1-p3" = substituteSource {
      src = fetchzip {
        name = "hunter-minizip-1_0_1-p3-source";
        url = "https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz";
        hash = "sha256-99uujp3c7NXQgyHSPDs22PnNyV0IR0WBhivIEmuej1E=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-openddlparser-0_1_0-p2" = substituteSource {
      src = fetchzip {
        name = "hunter-openddlparser-0_1_0-p2-source";
        url = "https://github.com/hunter-packages/openddl-parser/archive/v0.1.0-p2.tar.gz";
        hash = "sha256-O4u04uf00hf60dmhWHU3ph3Tlw0dBLyjTSRcU0mwehk=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-pugixml-1_10-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-pugixml-1_10-p0-source";
        url = "https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz";
        hash = "sha256-2F3RnpY6oqnSvIlsb8ohkezQebvSlJNLiGCAMOeWkdI=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-stb-0_0_0-80c8f6a-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-stb-0_0_0-80c8f6a-p0-source";
        url = "https://github.com/cpp-pm/stb/archive/refs/tags/v0.0.0-80c8f6a-p0.tar.gz";
        hash = "sha256-vZ4uzOP2PK/QA6Wu6Pw5zLrcbE0GRcZYqxfnj15EFck=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-utf8-3_1_1" = substituteSource {
      src = fetchzip {
        name = "hunter-utf8-3_1_1-source";
        url = "https://github.com/nemtrif/utfcpp/archive/v3.1.1.tar.gz";
        hash = "sha256-zDlRpBbpFbdAKd2Y+HP3JVf9bF9advpJrRr2egRNt7Q=";
      };
    };
    "python_mrpt/mrpt/v5/v0/hunter-zip-0_1_15" = substituteSource {
      src = fetchzip {
        name = "hunter-zip-0_1_15-source";
        url = "https://github.com/kuba--/zip/archive/v0.1.15.tar.gz";
        hash = "sha256-BGzqiYqDqC2y8NkURsCf5OKepw5J26Ql0bQGZsaUdb8=";
      };
    };
  });
  meta = {
    description = "Python wrapper for Mobile Robot Programming Toolkit (MRPT) libraries";
  };
})
