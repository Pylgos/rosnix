{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
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
    rviz_assimp_vendor = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "440613e22116aae5f35e5724e5f12940bab3b400";
        hash = "sha256-Aoy6roz9YZN3aM9DFeaIM8HrOHfthE5rI+t/UWApmXg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/assimp/assimp.git";
          to = "VCS_TYPE path VCS_URL ${rviz_assimp_vendor-vendor_source-assimp-0}";
        }
      ];
    };
    rviz_assimp_vendor-vendor_source-assimp-0 = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-vendor_source-assimp-0-source";
        url = "https://github.com/assimp/assimp.git";
        rev = "6a08c39e3a91ef385e76515cfad86aca4bfd57ff";
        hash = "sha256-ResIn+TA/FvrFt5+svMyLCJb2e+lyHFWopHBuzoXAhQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.24.18.tar.gz\"";
          to = "URL ${python_mrpt-vendor_source-mrpt-0-vendor_source-v5-0-vendor_source-v0-0}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_assimp_vendor";
  version = "14.1.5-1";
  src = sources.rviz_assimp_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around assimp, providing nothing but a dependency on assimp, on some systems. On others, it provides a fixed CMake module or even an ExternalProject build of assimp.";
  };
}
