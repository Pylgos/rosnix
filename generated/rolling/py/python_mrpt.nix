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
    1-vendor_source-194wgjaif5d22wjaqxqbpy9v1ny4nqmgjj2qlrmrbpszsccjl3yb = substituteSource {
      src = fetchzip {
        name = "1-vendor_source-194wgjaif5d22wjaqxqbpy9v1ny4nqmgjj2qlrmrbpszsccjl3yb-source";
        url = "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz";
        hash = "sha256-yw8qGdNf35VrplhI+Sq2xNuwk78Ld6wkF6IVF5V8nKQ=";
      };
      substitutions = [
      ];
    };
    eigen-3-vendor_source-1i3cvg8d70dk99fl3lrv3wqhfpdnm5kx01fl7r2bz46sk9bphwm1 = substituteSource {
      src = fetchzip {
        name = "eigen-3-vendor_source-1i3cvg8d70dk99fl3lrv3wqhfpdnm5kx01fl7r2bz46sk9bphwm1-source";
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2";
        hash = "sha256-oXJ4V5rakL9EPtQF0Geptl0HMR8700FdSrOB09DbbMQ=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx}";
        }
      ];
    };
    hunter-RapidJSON-1_0_2-p2-0cv9g6jmb2gj27dn4zjb5rmmmhwzz1dm7f55222yq3xqba6ahdqj = substituteSource {
      src = fetchzip {
        name = "hunter-RapidJSON-1_0_2-p2-0cv9g6jmb2gj27dn4zjb5rmmmhwzz1dm7f55222yq3xqba6ahdqj-source";
        url = "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz";
        hash = "sha256-EjeojFq4D+yFEKW4U1v4n8Naay5LfmLbEfKJVaV5aTM=";
      };
      substitutions = [
      ];
    };
    hunter-RapidJSON-1_1_0-b557259-p0-035lnhpcnxryzsgdbafzfhl9mdfh2xxbw24719rp869rfssivzqz = substituteSource {
      src = fetchzip {
        name = "hunter-RapidJSON-1_1_0-b557259-p0-035lnhpcnxryzsgdbafzfhl9mdfh2xxbw24719rp869rfssivzqz-source";
        url = "https://github.com/cpp-pm/rapidjson/archive/refs/tags/v1.1.0-b557259-p0.tar.gz";
        hash = "sha256-H/8dtXY5GXRzCocIvnoX0LWaKHTfqdWe/j53yy60tAw=";
      };
      substitutions = [
      ];
    };
    hunter-ZLIB-1_2_13-p0-15dr81gq0mjnl3f6ryiqk0mvch00fmr8pjbm6fxf0kzx33qsc9v3 = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_13-p0-15dr81gq0mjnl3f6ryiqk0mvch00fmr8pjbm6fxf0kzx33qsc9v3-source";
        url = "https://github.com/cpp-pm/zlib/archive/v1.2.13-p0.tar.gz";
        hash = "sha256-Yyem8Rj9T+C6M3XJi3J1AEC2K5g4+mzcoFZWgF9AuZU=";
      };
      substitutions = [
      ];
    };
    hunter-ZLIB-1_2_8-p3-0c97k1vmhwdhd8g5z9h3n4v7k53mzn3vhvwd165mb07nxk9hc0rb = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_8-p3-0c97k1vmhwdhd8g5z9h3n4v7k53mzn3vhvwd165mb07nxk9hc0rb-source";
        url = "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz";
        hash = "sha256-KwMG0+z2gFWLCY1vuIf9dZR5NrEDpl8earBxWHeYJzE=";
      };
      substitutions = [
      ];
    };
    hunter-draco-1_4_1-p0-05fmj622j1p9z6sp4paz1nx3hdm8q96fq54lrlggpzdq7pirzjaj = substituteSource {
      src = fetchzip {
        name = "hunter-draco-1_4_1-p0-05fmj622j1p9z6sp4paz1nx3hdm8q96fq54lrlggpzdq7pirzjaj-source";
        url = "https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz";
        hash = "sha256-Usmf4z24/fsezZQU7EzCqDY4ug1fXXK1+ekGKYSR1RU=";
      };
      substitutions = [
      ];
    };
    hunter-minizip-1_0_1-p1-1r7d21v9cv92r63m3zlcm0zb0kzghwg2q97q2x8199x7bhf1z28h = substituteSource {
      src = fetchzip {
        name = "hunter-minizip-1_0_1-p1-1r7d21v9cv92r63m3zlcm0zb0kzghwg2q97q2x8199x7bhf1z28h-source";
        url = "https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz";
        hash = "sha256-EIkfHFynpxRQF/gkLB6H70+wPqiM/lGHySJtlnYQ7eQ=";
      };
      substitutions = [
      ];
    };
    hunter-minizip-1_0_1-p3-0lcgkrmi5j1bhs0laiq8bp4wvyfq6qxkrli1hg8dbv6wkn7axnzp = substituteSource {
      src = fetchzip {
        name = "hunter-minizip-1_0_1-p3-0lcgkrmi5j1bhs0laiq8bp4wvyfq6qxkrli1hg8dbv6wkn7axnzp-source";
        url = "https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz";
        hash = "sha256-99uujp3c7NXQgyHSPDs22PnNyV0IR0WBhivIEmuej1E=";
      };
      substitutions = [
      ];
    };
    hunter-openddlparser-0_1_0-p2-06bsn14m6p149nivq10x1nbx67d66xsmi8frs7x1glplwzib92rv = substituteSource {
      src = fetchzip {
        name = "hunter-openddlparser-0_1_0-p2-06bsn14m6p149nivq10x1nbx67d66xsmi8frs7x1glplwzib92rv-source";
        url = "https://github.com/hunter-packages/openddl-parser/archive/v0.1.0-p2.tar.gz";
        hash = "sha256-O4u04uf00hf60dmhWHU3ph3Tlw0dBLyjTSRcU0mwehk=";
      };
      substitutions = [
      ];
    };
    hunter-pugixml-1_10-p0-1llijvkk1030i15r756jpdwx1v4i4756yv49pk9ak8isjsgd2pfq = substituteSource {
      src = fetchzip {
        name = "hunter-pugixml-1_10-p0-1llijvkk1030i15r756jpdwx1v4i4756yv49pk9ak8isjsgd2pfq-source";
        url = "https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz";
        hash = "sha256-2F3RnpY6oqnSvIlsb8ohkezQebvSlJNLiGCAMOeWkdI=";
      };
      substitutions = [
      ];
    };
    hunter-stb-0_0_0-80c8f6a-p0-1j8m8ig8zrqpmdccci869mndrfnc77yfibm50g8ayg7nwg62x7mx = substituteSource {
      src = fetchzip {
        name = "hunter-stb-0_0_0-80c8f6a-p0-1j8m8ig8zrqpmdccci869mndrfnc77yfibm50g8ayg7nwg62x7mx-source";
        url = "https://github.com/cpp-pm/stb/archive/refs/tags/v0.0.0-80c8f6a-p0.tar.gz";
        hash = "sha256-vZ4uzOP2PK/QA6Wu6Pw5zLrcbE0GRcZYqxfnj15EFck=";
      };
      substitutions = [
      ];
    };
    hunter-utf8-3_1_1-1d5p9l27mxhsmm4zlxjsbxngsmr5yxrzi66x550bf5g92sj52ffc = substituteSource {
      src = fetchzip {
        name = "hunter-utf8-3_1_1-1d5p9l27mxhsmm4zlxjsbxngsmr5yxrzi66x550bf5g92sj52ffc-source";
        url = "https://github.com/nemtrif/utfcpp/archive/v3.1.1.tar.gz";
        hash = "sha256-zDlRpBbpFbdAKd2Y+HP3JVf9bF9advpJrRr2egRNt7Q=";
      };
      substitutions = [
      ];
    };
    hunter-zip-0_1_15-1gvmjk36c1mls4js9ns91skrxqp4kz04c56ry2r2va43ia4ylv04 = substituteSource {
      src = fetchzip {
        name = "hunter-zip-0_1_15-1gvmjk36c1mls4js9ns91skrxqp4kz04c56ry2r2va43ia4ylv04-source";
        url = "https://github.com/kuba--/zip/archive/v0.1.15.tar.gz";
        hash = "sha256-BGzqiYqDqC2y8NkURsCf5OKepw5J26Ql0bQGZsaUdb8=";
      };
      substitutions = [
      ];
    };
    lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx = substituteSource {
      src = fetchurl {
        name = "lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    mrpt-vendor_source-833914f525ea2452d052da119debdcb49afc08e6 = substituteSource {
      src = fetchgit {
        name = "mrpt-vendor_source-833914f525ea2452d052da119debdcb49afc08e6-source";
        url = "https://github.com/MRPT/mrpt.git";
        rev = "833914f525ea2452d052da119debdcb49afc08e6";
        hash = "sha256-4008v02Hqakjti9XZz1Np9JxXiUFcgT1Pku3raTNsyA=";
      };
      substitutions = [
        {
          path = "cmakemodules/script_assimp.cmake";
          from = "URL               \"https://github.com/assimp/assimp/archive/v5.3.1.tar.gz\"";
          to = "URL ${v5-vendor_source-09m3qcvyc46g55wxkdzw7mvfpz49c6f2snssvh2npx8ypagkql7z}";
        }
        {
          path = "cmakemodules/script_eigen.cmake";
          from = "URL               \"https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.bz2\"";
          to = "URL ${eigen-3-vendor_source-1i3cvg8d70dk99fl3lrv3wqhfpdnm5kx01fl7r2bz46sk9bphwm1}";
        }
        {
          path = "cmakemodules/script_jpeg.cmake";
          from = "URL               \"https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.90.tar.gz\"";
          to = "URL ${1-vendor_source-194wgjaif5d22wjaqxqbpy9v1ny4nqmgjj2qlrmrbpszsccjl3yb}";
        }
        {
          path = "cmakemodules/script_octomap.cmake";
          from = "URL               \"\${OCTOMAP_EP_URL}\"";
          to = "URL ${v1-vendor_source-03v341dffa0pfzmf2431xb5nq50zq9zlhgl6k2aa3fsza5xmbb70}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.cpp";
          to = "DOWNLOAD file://${tinyxml2-vendor_source-13jg99m02pyvsq8lmi81scs5116anvp9ajzg7hyhcb852wcjvjhh}";
        }
        {
          path = "cmakemodules/script_tinyxml2.cmake";
          from = "DOWNLOAD\n			https://github.com/leethomason/tinyxml2/raw/\${TINYXML2_VERSION_TO_DOWNLOAD}/tinyxml2.h";
          to = "DOWNLOAD file://${tinyxml2-vendor_source-02adhm6xwbb49s9jbfnj6d4pk1zdi49ds731m0bw94vqlkzj0xqb}";
        }
      ];
    };
    python_mrpt-a2208688bd0af0c0374965c55eb72d638636df90 = substituteSource {
      src = fetchgit {
        name = "python_mrpt-a2208688bd0af0c0374965c55eb72d638636df90-source";
        url = "https://github.com/ros2-gbp/python_mrpt_ros-release.git";
        rev = "a2208688bd0af0c0374965c55eb72d638636df90";
        hash = "sha256-BFZtPkFFaSpAsfSp1DxoqgYPSKPDULt2dvUm2lpF98A=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/MRPT/mrpt.git";
          to = "URL ${mrpt-vendor_source-833914f525ea2452d052da119debdcb49afc08e6}";
        }
      ];
    };
    tinyxml2-vendor_source-02adhm6xwbb49s9jbfnj6d4pk1zdi49ds731m0bw94vqlkzj0xqb = substituteSource {
      src = fetchurl {
        name = "tinyxml2-vendor_source-02adhm6xwbb49s9jbfnj6d4pk1zdi49ds731m0bw94vqlkzj0xqb-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.h";
        hash = "sha256-C3cg/6R4k8QXqGEc3RKJ7Yd5STPSuiWTTmQt3k2FTQk=";
      };
      substitutions = [
      ];
    };
    tinyxml2-vendor_source-13jg99m02pyvsq8lmi81scs5116anvp9ajzg7hyhcb852wcjvjhh = substituteSource {
      src = fetchurl {
        name = "tinyxml2-vendor_source-13jg99m02pyvsq8lmi81scs5116anvp9ajzg7hyhcb852wcjvjhh-source";
        url = "https://github.com/leethomason/tinyxml2/raw/7.1.0/tinyxml2.cpp";
        hash = "sha256-EMotGRcFLQY9PO9Lle62yoRQNNMBxUoR1ttfAWpKT44=";
      };
      substitutions = [
      ];
    };
    v0-vendor_source-0c8ixqx2hzgcravi84skh04h8qa46rb1j7q0cxvm0shl7c75jicb = substituteSource {
      src = fetchzip {
        name = "v0-vendor_source-0c8ixqx2hzgcravi84skh04h8qa46rb1j7q0cxvm0shl7c75jicb-source";
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
          to = "URL ${hunter-RapidJSON-1_1_0-b557259-p0-035lnhpcnxryzsgdbafzfhl9mdfh2xxbw24719rp869rfssivzqz}";
        }
        {
          path = "cmake/projects/RapidJSON/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p2.tar.gz\"";
          to = "URL ${hunter-RapidJSON-1_0_2-p2-0cv9g6jmb2gj27dn4zjb5rmmmhwzz1dm7f55222yq3xqba6ahdqj}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/zlib/archive/v1.2.13-p0.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_2_13-p0-15dr81gq0mjnl3f6ryiqk0mvch00fmr8pjbm6fxf0kzx33qsc9v3}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_2_8-p3-0c97k1vmhwdhd8g5z9h3n4v7k53mzn3vhvwd165mb07nxk9hc0rb}";
        }
        {
          path = "cmake/projects/draco/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/draco/archive/v1.4.1-p0.tar.gz\"";
          to = "URL ${hunter-draco-1_4_1-p0-05fmj622j1p9z6sp4paz1nx3hdm8q96fq54lrlggpzdq7pirzjaj}";
        }
        {
          path = "cmake/projects/minizip/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz\"";
          to = "URL ${hunter-minizip-1_0_1-p1-1r7d21v9cv92r63m3zlcm0zb0kzghwg2q97q2x8199x7bhf1z28h}";
        }
        {
          path = "cmake/projects/minizip/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz\"";
          to = "URL ${hunter-minizip-1_0_1-p3-0lcgkrmi5j1bhs0laiq8bp4wvyfq6qxkrli1hg8dbv6wkn7axnzp}";
        }
        {
          path = "cmake/projects/openddlparser/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/openddl-parser/archive/v0.1.0-p2.tar.gz\"";
          to = "URL ${hunter-openddlparser-0_1_0-p2-06bsn14m6p149nivq10x1nbx67d66xsmi8frs7x1glplwzib92rv}";
        }
        {
          path = "cmake/projects/pugixml/hunter.cmake";
          from = "URL \"https://github.com/cpp-pm/pugixml/archive/v1.10-p0.tar.gz\"";
          to = "URL ${hunter-pugixml-1_10-p0-1llijvkk1030i15r756jpdwx1v4i4756yv49pk9ak8isjsgd2pfq}";
        }
        {
          path = "cmake/projects/stb/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/stb/archive/refs/tags/v0.0.0-80c8f6a-p0.tar.gz\"";
          to = "URL ${hunter-stb-0_0_0-80c8f6a-p0-1j8m8ig8zrqpmdccci869mndrfnc77yfibm50g8ayg7nwg62x7mx}";
        }
        {
          path = "cmake/projects/utf8/hunter.cmake";
          from = "URL\n    \"https://github.com/nemtrif/utfcpp/archive/v3.1.1.tar.gz\"";
          to = "URL ${hunter-utf8-3_1_1-1d5p9l27mxhsmm4zlxjsbxngsmr5yxrzi66x550bf5g92sj52ffc}";
        }
        {
          path = "cmake/projects/zip/hunter.cmake";
          from = "URL\n    \"https://github.com/kuba--/zip/archive/v0.1.15.tar.gz\"";
          to = "URL ${hunter-zip-0_1_15-1gvmjk36c1mls4js9ns91skrxqp4kz04c56ry2r2va43ia4ylv04}";
        }
      ];
    };
    v1-vendor_source-03v341dffa0pfzmf2431xb5nq50zq9zlhgl6k2aa3fsza5xmbb70 = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-03v341dffa0pfzmf2431xb5nq50zq9zlhgl6k2aa3fsza5xmbb70-source";
        url = "https://github.com/OctoMap/octomap/archive/v1.9.6.zip";
        hash = "sha256-4KxVe1Ffu6GUmIY+SH/CHxRsy+phEOHqdxco51ogYw8=";
      };
      substitutions = [
      ];
    };
    v5-vendor_source-09m3qcvyc46g55wxkdzw7mvfpz49c6f2snssvh2npx8ypagkql7z = substituteSource {
      src = fetchzip {
        name = "v5-vendor_source-09m3qcvyc46g55wxkdzw7mvfpz49c6f2snssvh2npx8ypagkql7z-source";
        url = "https://github.com/assimp/assimp/archive/v5.3.1.tar.gz";
        hash = "sha256-/1A8n7oe9WsF3FpbLZxhifzrdj38t9l5Kc8Q5jfDoyY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.24.18.tar.gz\"";
          to = "URL ${v0-vendor_source-0c8ixqx2hzgcravi84skh04h8qa46rb1j7q0cxvm0shl7c75jicb}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "python_mrpt";
  version = "2.14.1-1";
  src = sources.python_mrpt-a2208688bd0af0c0374965c55eb72d638636df90;
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
