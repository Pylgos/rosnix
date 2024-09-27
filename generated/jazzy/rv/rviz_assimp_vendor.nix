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
    assimp-vendor_source-6a08c39e3a91ef385e76515cfad86aca4bfd57ff = substituteSource {
      src = fetchgit {
        name = "assimp-vendor_source-6a08c39e3a91ef385e76515cfad86aca4bfd57ff-source";
        url = "https://github.com/assimp/assimp.git";
        rev = "6a08c39e3a91ef385e76515cfad86aca4bfd57ff";
        hash = "sha256-ResIn+TA/FvrFt5+svMyLCJb2e+lyHFWopHBuzoXAhQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.24.18.tar.gz\"";
          to = "URL ${v0-vendor_source-0c8ixqx2hzgcravi84skh04h8qa46rb1j7q0cxvm0shl7c75jicb}";
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
    rviz_assimp_vendor-440613e22116aae5f35e5724e5f12940bab3b400 = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-440613e22116aae5f35e5724e5f12940bab3b400-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "440613e22116aae5f35e5724e5f12940bab3b400";
        hash = "sha256-Aoy6roz9YZN3aM9DFeaIM8HrOHfthE5rI+t/UWApmXg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/assimp/assimp.git";
          to = "VCS_TYPE path VCS_URL ${assimp-vendor_source-6a08c39e3a91ef385e76515cfad86aca4bfd57ff}";
        }
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
  };
in
buildRosPackage {
  pname = "rviz_assimp_vendor";
  version = "14.1.5-1";
  src = sources.rviz_assimp_vendor-440613e22116aae5f35e5724e5f12940bab3b400;
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
