{
  ament-cmake,
  buildAmentCmakePackage,
  buildPackages,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai";
  version = "2.30.0-1";
  src = finalAttrs.passthru.sources."depthai";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" "libusb-1.0-dev" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "libusb-1.0-dev" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai" = substituteSource {
      src = fetchgit {
        name = "depthai-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "bcb5450bbb7d87228d46af63223e4b37d1474c1b";
        hash = "sha256-uCHpu+2PRFlvHdNKrZutKOd8RQLhwPDeuV3x3qu+Vrc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/9d9242b60d5236269f894efd3ddd60a9ca83dd7f.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz\"";
          to = "URL ${sources."depthai/v1-1"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/catchorg/Catch2/archive/refs/tags/v3.4.0.tar.gz\"";
          to = "URL ${sources."depthai/v3"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/cpp-pm/curl/archive/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47.tar.gz\"";
          to = "URL ${sources."depthai/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz\"";
          to = "URL ${sources."depthai/v1-2"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/FP16/archive/c911175d2717e562976e606c6e5f799bf40cf94e.tar.gz\"";
          to = "URL ${sources."depthai/c911175d2717e562976e606c6e5f799bf40cf94e"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/XLink/archive/82839cb04f2102177fad926fb8f7fcf7b4093cb1.tar.gz\"";
          to = "URL ${sources."depthai/82839cb04f2102177fad926fb8f7fcf7b4093cb1"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/cpr/archive/50a1321738554e0152b0a6f1b0ca24e4fdecff5c.tar.gz\"";
          to = "URL ${sources."depthai/50a1321738554e0152b0a6f1b0ca24e4fdecff5c"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/filesystem/archive/d29630953f3526b61842d937764f012503a79ec3.tar.gz\"";
          to = "URL ${sources."depthai/d29630953f3526b61842d937764f012503a79ec3"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libarchive/archive/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a.tar.gz\"";
          to = "URL ${sources."depthai/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libnop/archive/ab842f51dc2eb13916dc98417c2186b78320ed10.tar.gz\"";
          to = "URL ${sources."depthai/ab842f51dc2eb13916dc98417c2186b78320ed10"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${sources."depthai/b7e4548958325b18feb73977163ad44398099534"}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/zlib/archive/refs/tags/v1.2.11-p2.tar.gz\"";
          to = "URL ${sources."depthai/v1-3"}";
        }
      ];
    };
    "depthai/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47" = substituteSource {
      src = fetchzip {
        name = "25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-source";
        url = "https://github.com/cpp-pm/curl/archive/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47.tar.gz";
        hash = "sha256-vlSBSnJ1xWC9eKAoG5TdOfD3/Lgs+4VnkMTL6x7MMt8=";
      };
    };
    "depthai/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a" = substituteSource {
      src = fetchzip {
        name = "45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-source";
        url = "https://github.com/luxonis/libarchive/archive/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a.tar.gz";
        hash = "sha256-6KTBpL1ibQAwRdzcan+qPhV5cNPHlxwhPJ+swOwJ92g=";
      };
    };
    "depthai/50a1321738554e0152b0a6f1b0ca24e4fdecff5c" = substituteSource {
      src = fetchzip {
        name = "50a1321738554e0152b0a6f1b0ca24e4fdecff5c-source";
        url = "https://github.com/luxonis/cpr/archive/50a1321738554e0152b0a6f1b0ca24e4fdecff5c.tar.gz";
        hash = "sha256-qvFkVEI+5DmK1fE+U7Rm8G5NyF1wqVq0oOE2TGoQiAE=";
      };
    };
    "depthai/82839cb04f2102177fad926fb8f7fcf7b4093cb1" = substituteSource {
      src = fetchzip {
        name = "82839cb04f2102177fad926fb8f7fcf7b4093cb1-source";
        url = "https://github.com/luxonis/XLink/archive/82839cb04f2102177fad926fb8f7fcf7b4093cb1.tar.gz";
        hash = "sha256-OTqJfTDudiNrdsDBe1Pg0T1dJcfneGXO/+AIbXpVfxk=";
      };
      substitutions = [
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${sources."depthai/82839cb04f2102177fad926fb8f7fcf7b4093cb1/b7e4548958325b18feb73977163ad44398099534"}";
        }
      ];
    };
    "depthai/82839cb04f2102177fad926fb8f7fcf7b4093cb1/b7e4548958325b18feb73977163ad44398099534" = substituteSource {
      src = fetchzip {
        name = "b7e4548958325b18feb73977163ad44398099534-source";
        url = "https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz";
        hash = "sha256-DjT7ooqQeRIXt2pRwznaT7twpzOVAea62ngJk1y2mUI=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f" = substituteSource {
      src = fetchzip {
        name = "9d9242b60d5236269f894efd3ddd60a9ca83dd7f-source";
        url = "https://github.com/cpp-pm/hunter/archive/9d9242b60d5236269f894efd3ddd60a9ca83dd7f.tar.gz";
        hash = "sha256-zd7ddxplyZccBOqWCyLeMhCysxsnRIK48ccdIks9dBA=";
      };
      substitutions = [
        {
          path = "cmake/projects/BZip2/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/bzip2/archive/v1.0.8-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-BZip2-1_0_8-p0"}";
        }
        {
          path = "cmake/projects/BZip2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/bzip2/archive/v1.0.6-p3.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-BZip2-1_0_6-p3"}";
        }
        {
          path = "cmake/projects/CURL/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/curl/archive/refs/tags/v8.5.0-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-CURL-8_5_0-p0"}";
        }
        {
          path = "cmake/projects/CURL/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-CURL-7_49_1-DEV-v8"}";
        }
        {
          path = "cmake/projects/Expat/hunter.cmake";
          from = "URL\n    \"https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Expat-2_1_1"}";
        }
        {
          path = "cmake/projects/Expat/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Expat-2_2_9-p0"}";
        }
        {
          path = "cmake/projects/FP16/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-FP16-0_0_0-febbb1c-p0"}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/google/googletest/archive/v1.14.0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-GTest-1_14_0"}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-GTest-1_8_0-hunter-p7"}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-GTest-1_7_0-hunter-6"}";
        }
        {
          path = "cmake/projects/Libssh2/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/libssh2/archive/v1.9.0-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Libssh2-1_9_0-p0"}";
        }
        {
          path = "cmake/projects/Libssh2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/libssh2/archive/libssh2-1.7.0-hunter-4.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Libssh2-1_7_0"}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-OpenSSL-1_0_2l"}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://github.com/openssl/openssl/archive/OpenSSL_1_1_0f.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-OpenSSL-1_1_0f"}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://www.openssl.org/source/openssl-3.0.12.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-OpenSSL-3_0_12"}";
        }
        {
          path = "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in";
          from = ". \"@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh\" && ";
          to = "";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/zlib/archive/refs/tags/v1.3.0-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-ZLIB-1_3_0-p0"}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-ZLIB-1_2_8-p3"}";
        }
        {
          path = "cmake/projects/fmt/hunter.cmake";
          from = "URL\n    \"https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-fmt-10_1_1"}";
        }
        {
          path = "cmake/projects/fmt/hunter.cmake";
          from = "URL\n    \"https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-fmt-4_0_0"}";
        }
        {
          path = "cmake/projects/intsizeof/hunter.cmake";
          from = "URL\n    \"https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-intsizeof-2_0_1"}";
        }
        {
          path = "cmake/projects/intsizeof/hunter.cmake";
          from = "URL\n    \"https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-intsizeof-2_0_2"}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/julianoes/jsoncpp/archive/refs/tags/1.9.5-b1.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-jsoncpp-1_9_5-b1"}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-jsoncpp-0_7_0"}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/open-source-parsers/jsoncpp/archive/1.8.0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-jsoncpp-1_8_0"}";
        }
        {
          path = "cmake/projects/libxml2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-libxml2-2_9_7-p0"}";
        }
        {
          path = "cmake/projects/lz4/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-lz4-1_9_2-p0"}";
        }
        {
          path = "cmake/projects/lzma/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-lzma-5_2_3-p4"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-nlohmann_json-2_1_1-p1"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.11.2.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-nlohmann_json-3_11_2"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.9.1.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-nlohmann_json-3_9_1"}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/spdlog/archive/v1.12.0-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-1_12_0-p0"}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/spdlog/archive/v0.13.0-p1.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-0_13_0-p1"}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-1_0_0-p0"}";
        }
        {
          path = "cmake/projects/zstd/hunter.cmake";
          from = "URL\n    \"https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz\"";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-zstd-1_5_5"}";
        }
      ];
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-BZip2-1_0_6-p3" = substituteSource {
      src = fetchzip {
        name = "hunter-BZip2-1_0_6-p3-source";
        url = "https://github.com/hunter-packages/bzip2/archive/v1.0.6-p3.tar.gz";
        hash = "sha256-P9O19T1JNI+9fEFnJ1ye2NOEKZlNrn0JldCNnEyXH+w=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-BZip2-1_0_8-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-BZip2-1_0_8-p0-source";
        url = "https://github.com/cpp-pm/bzip2/archive/v1.0.8-p0.tar.gz";
        hash = "sha256-vb++9wk5te3iMdmyDkm/UAS/2G+wWex8iSZyMaGHs18=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-CURL-7_49_1-DEV-v8" = substituteSource {
      src = fetchzip {
        name = "hunter-CURL-7_49_1-DEV-v8-source";
        url = "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz";
        hash = "sha256-AydgS3/18V19MQLVHeGcywN7u509/PpZ3VSKFNlmyo4=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-CURL-8_5_0-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-CURL-8_5_0-p0-source";
        url = "https://github.com/cpp-pm/curl/archive/refs/tags/v8.5.0-p0.tar.gz";
        hash = "sha256-t43zsxtkdYTn66cw69SMI5RlLXQMaQnWW/tB5mJUddw=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Expat-2_1_1" = substituteSource {
      src = fetchzip {
        name = "hunter-Expat-2_1_1-source";
        url = "https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz";
        hash = "sha256-tHNOmb+8qggdJQp1ZC6JJ9Tkvh3QLUWZvK0jDM0zmX8=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Expat-2_2_9-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-Expat-2_2_9-p0-source";
        url = "https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz";
        hash = "sha256-lUECusiwUIXSA6zHm2qSjptcnMGyK6IkM3GErfxIKfg=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-FP16-0_0_0-febbb1c-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-FP16-0_0_0-febbb1c-p0-source";
        url = "https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz";
        hash = "sha256-AFlV31tc0xDbr5eqWPxv8Uj3vvXR3X1ChBBOTuF6VIo=";
      };
      substitutions = [
        {
          path = "cmake/DownloadGoogleBenchmark.cmake";
          from = "URL https://github.com/google/benchmark/archive/v1.2.0.zip";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-FP16-0_0_0-febbb1c-p0/v1"}";
        }
        {
          path = "cmake/DownloadPSimd.cmake";
          from = "GIT_REPOSITORY https://github.com/Maratyszcza/psimd.git";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-FP16-0_0_0-febbb1c-p0/psimd"}";
        }
      ];
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-FP16-0_0_0-febbb1c-p0/psimd" = substituteSource {
      src = fetchgit {
        name = "psimd-source";
        url = "https://github.com/Maratyszcza/psimd.git";
        rev = "072586a71b55b7f8c584153d223e95687148a900";
        hash = "sha256-lV+VZi2b4SQlRYrhKx9Dxc6HlDEFz3newvcBjTekupo=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-FP16-0_0_0-febbb1c-p0/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/google/benchmark/archive/v1.2.0.zip";
        hash = "sha256-iFRgjLkftuszAqBnmS9GXU8BwYnabmwMAQyw19sfjb4=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-GTest-1_14_0" = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_14_0-source";
        url = "https://github.com/google/googletest/archive/v1.14.0.tar.gz";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-GTest-1_7_0-hunter-6" = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_7_0-hunter-6-source";
        url = "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz";
        hash = "sha256-s4gpAVc8dVgwPFD4QANFeKfwIwymRsJSUzpnkW+tOkU=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-GTest-1_8_0-hunter-p7" = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_8_0-hunter-p7-source";
        url = "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz";
        hash = "sha256-3UKXA2WpIDUT7UujipX0DVQcbzmyccvh2Woc7Hs954I=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Libssh2-1_7_0" = substituteSource {
      src = fetchzip {
        name = "hunter-Libssh2-1_7_0-source";
        url = "https://github.com/hunter-packages/libssh2/archive/libssh2-1.7.0-hunter-4.tar.gz";
        hash = "sha256-qPqJteirsrPuXRiNXpDx1WYamClQRc40CAFYnNz0FrE=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-Libssh2-1_9_0-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-Libssh2-1_9_0-p0-source";
        url = "https://github.com/cpp-pm/libssh2/archive/v1.9.0-p0.tar.gz";
        hash = "sha256-DB6kbXQrpsqq8dJasrVzTTU2IfR9PImkOPQuL/v3BHA=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-OpenSSL-1_0_2l" = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-1_0_2l-source";
        url = "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz";
        hash = "sha256-KTgrY40My0QDHpQNUCZhjTqKWz27apiiWcL8gYk3HMA=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-OpenSSL-1_1_0f" = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-1_1_0f-source";
        url = "https://github.com/openssl/openssl/archive/OpenSSL_1_1_0f.tar.gz";
        hash = "sha256-OEwJ6GmdlE8B5VGkhsHGeIAis9hkBTRTA9f5PTJv3LA=";
      };
      substitutions = [
        {
          path = "Configure";
          from = "#! /usr/bin/env perl";
          to = "#!${buildPackages.perl}/bin/perl";
        }
      ];
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-OpenSSL-3_0_12" = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-3_0_12-source";
        url = "https://www.openssl.org/source/openssl-3.0.12.tar.gz";
        hash = "sha256-UOTgvfmOG8vEFIlIJcoxJ0SEqntcDUYDJ2phCfPLQ7A=";
      };
      substitutions = [
        {
          path = "Configure";
          from = "#! /usr/bin/env perl";
          to = "#!${buildPackages.perl}/bin/perl";
        }
      ];
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-ZLIB-1_2_8-p3" = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_8-p3-source";
        url = "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz";
        hash = "sha256-KwMG0+z2gFWLCY1vuIf9dZR5NrEDpl8earBxWHeYJzE=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-ZLIB-1_3_0-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_3_0-p0-source";
        url = "https://github.com/cpp-pm/zlib/archive/refs/tags/v1.3.0-p0.tar.gz";
        hash = "sha256-D07tEFsScfn4Vf/p/jlyR+Dn+9X6d9Oti6r/7YDqxBg=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-fmt-10_1_1" = substituteSource {
      src = fetchzip {
        name = "hunter-fmt-10_1_1-source";
        url = "https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz";
        hash = "sha256-H9+1lEaHM12nzXSmo9m8S6527t+97e6necayyjCPm1A=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-fmt-4_0_0" = substituteSource {
      src = fetchzip {
        name = "hunter-fmt-4_0_0-source";
        url = "https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz";
        hash = "sha256-KgGMeTgVR4lBUbYiy/2yQY9jaBeovldfDTmihPl2+Ds=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-intsizeof-2_0_1" = substituteSource {
      src = fetchzip {
        name = "hunter-intsizeof-2_0_1-source";
        url = "https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz";
        hash = "sha256-le9EGCO9wdDFxzVm6SWbWq2G76D+5no1ftXB83wyJ6I=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-intsizeof-2_0_2" = substituteSource {
      src = fetchzip {
        name = "hunter-intsizeof-2_0_2-source";
        url = "https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz";
        hash = "sha256-qjc7wEWTpYyrkltM+Y9Ibs4zkNZZd5bfD2lz2VfFS3c=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-jsoncpp-0_7_0" = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-0_7_0-source";
        url = "https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz";
        hash = "sha256-yV/i+rI7L77vtXb9WU+HSSx8WK7k/0Z0NqHMrVahBzY=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-jsoncpp-1_8_0" = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-1_8_0-source";
        url = "https://github.com/open-source-parsers/jsoncpp/archive/1.8.0.tar.gz";
        hash = "sha256-LVHZ0Qu3JtR422i+563/y03RujjfccBX6CBQK/MX4tE=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-jsoncpp-1_9_5-b1" = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-1_9_5-b1-source";
        url = "https://github.com/julianoes/jsoncpp/archive/refs/tags/1.9.5-b1.tar.gz";
        hash = "sha256-VjzW4vW+5CgrBPgTxk9ocR2HkRqt3emKoBukiGuuTHM=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-libxml2-2_9_7-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-libxml2-2_9_7-p0-source";
        url = "https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz";
        hash = "sha256-2C/LaRqpnzajrPKrS/HPTqOT+Qj3oYmdwLTyS+0mzoM=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-lz4-1_9_2-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-lz4-1_9_2-p0-source";
        url = "https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz";
        hash = "sha256-j1HRy07iKu1Y54fuRyqEEsvMS/mHhBiJuwQBbvoIbtw=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-lzma-5_2_3-p4" = substituteSource {
      src = fetchzip {
        name = "hunter-lzma-5_2_3-p4-source";
        url = "https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz";
        hash = "sha256-DnjVgMJR5Ty9rcwM6fCQ9h+yLPFoDy6QE5Kkrhg62go=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-nlohmann_json-2_1_1-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-nlohmann_json-3_11_2" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_11_2-source";
        url = "https://github.com/nlohmann/json/archive/v3.11.2.tar.gz";
        hash = "sha256-SUdhIV7tjtacf5DkoWk9cnkfyMlrkg8ZU7XnPZd22Tw=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-nlohmann_json-3_9_1" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_9_1-source";
        url = "https://github.com/nlohmann/json/archive/v3.9.1.tar.gz";
        hash = "sha256-THordDPdH2qwk6lFTgeFmkl7iDuA/7YH71PTUe6vJCs=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-0_13_0-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-0_13_0-p1-source";
        url = "https://github.com/hunter-packages/spdlog/archive/v0.13.0-p1.tar.gz";
        hash = "sha256-Du5Fy/C92MqpmeR45+8UwK4pGOjP1FXbcYm64YvSQLE=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-1_0_0-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-1_0_0-p0-source";
        url = "https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz";
        hash = "sha256-BgF4bHwnQcSU80a28JZipNc5QP9hbOiDi4u4utmRIqs=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-1_12_0-p0" = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-1_12_0-p0-source";
        url = "https://github.com/cpp-pm/spdlog/archive/v1.12.0-p0.tar.gz";
        hash = "sha256-3N5Iq9o8aenRiBjvuDNuSqK780h5PMLF/Fg/8y93W+8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-1_12_0-p0/benchmark"}";
        }
      ];
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-spdlog-1_12_0-p0/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-zstd-1_5_5" = substituteSource {
      src = fetchzip {
        name = "hunter-zstd-1_5_5-source";
        url = "https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
    };
    "depthai/ab842f51dc2eb13916dc98417c2186b78320ed10" = substituteSource {
      src = fetchzip {
        name = "ab842f51dc2eb13916dc98417c2186b78320ed10-source";
        url = "https://github.com/luxonis/libnop/archive/ab842f51dc2eb13916dc98417c2186b78320ed10.tar.gz";
        hash = "sha256-d2z/lDI9pe5TR82MxGkR9bBMNXPvzqb9Gsd5jOv6x1A=";
      };
      substitutions = [
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googlemock.git\"";
          to = "URL ${sources."depthai/ab842f51dc2eb13916dc98417c2186b78320ed10/googlemock"}";
        }
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googletest.git\"";
          to = "URL ${sources."depthai/ab842f51dc2eb13916dc98417c2186b78320ed10/googletest"}";
        }
      ];
    };
    "depthai/ab842f51dc2eb13916dc98417c2186b78320ed10/googlemock" = substituteSource {
      src = fetchgit {
        name = "googlemock-source";
        url = "https://github.com/google/googlemock.git";
        rev = "778dc88acb34184f7c1e9208dac338dd4cd2aaf8";
        hash = "sha256-7KdgGz+dVi1AT/4pHt00wP2AtQJbZyjrYLhLMCsyb30=";
      };
    };
    "depthai/ab842f51dc2eb13916dc98417c2186b78320ed10/googletest" = substituteSource {
      src = fetchgit {
        name = "googletest-source";
        url = "https://github.com/google/googletest.git";
        rev = "6d1deeb565be215554ee28f0ec9c1ed0b12afa8e";
        hash = "sha256-w2JP5XDUPzyOtf6OY/UFkARa5X5w66W/IRnUAQ3Jg0s=";
      };
    };
    "depthai/b7e4548958325b18feb73977163ad44398099534" = substituteSource {
      src = fetchzip {
        name = "b7e4548958325b18feb73977163ad44398099534-source";
        url = "https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz";
        hash = "sha256-DjT7ooqQeRIXt2pRwznaT7twpzOVAea62ngJk1y2mUI=";
      };
    };
    "depthai/c911175d2717e562976e606c6e5f799bf40cf94e" = substituteSource {
      src = fetchzip {
        name = "c911175d2717e562976e606c6e5f799bf40cf94e-source";
        url = "https://github.com/luxonis/FP16/archive/c911175d2717e562976e606c6e5f799bf40cf94e.tar.gz";
        hash = "sha256-4U5WmqqljHYoKdKqtFRBX++vGCv/3weuqPFr4WG7GNM=";
      };
      substitutions = [
        {
          path = "cmake/DownloadGoogleBenchmark.cmake";
          from = "URL https://github.com/google/benchmark/archive/v1.2.0.zip";
          to = "URL ${sources."depthai/c911175d2717e562976e606c6e5f799bf40cf94e/v1"}";
        }
        {
          path = "cmake/DownloadPSimd.cmake";
          from = "URL https://github.com/Maratyszcza/psimd/archive/072586a71b55b7f8c584153d223e95687148a900.tar.gz";
          to = "URL ${sources."depthai/c911175d2717e562976e606c6e5f799bf40cf94e/072586a71b55b7f8c584153d223e95687148a900"}";
        }
      ];
    };
    "depthai/c911175d2717e562976e606c6e5f799bf40cf94e/072586a71b55b7f8c584153d223e95687148a900" = substituteSource {
      src = fetchzip {
        name = "072586a71b55b7f8c584153d223e95687148a900-source";
        url = "https://github.com/Maratyszcza/psimd/archive/072586a71b55b7f8c584153d223e95687148a900.tar.gz";
        hash = "sha256-lV+VZi2b4SQlRYrhKx9Dxc6HlDEFz3newvcBjTekupo=";
      };
    };
    "depthai/c911175d2717e562976e606c6e5f799bf40cf94e/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/google/benchmark/archive/v1.2.0.zip";
        hash = "sha256-iFRgjLkftuszAqBnmS9GXU8BwYnabmwMAQyw19sfjb4=";
      };
    };
    "depthai/d29630953f3526b61842d937764f012503a79ec3" = substituteSource {
      src = fetchzip {
        name = "d29630953f3526b61842d937764f012503a79ec3-source";
        url = "https://github.com/luxonis/filesystem/archive/d29630953f3526b61842d937764f012503a79ec3.tar.gz";
        hash = "sha256-3DRJIHQpHhUWr65IMizfO/vuEJHXXU9DKSECG093FgM=";
      };
    };
    "depthai/v1-1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz";
        hash = "sha256-2k5PjwFxgA/2XPqJrPHxgSInM61FBEcieppBx+MAUKw=";
      };
    };
    "depthai/v1-2" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
        hash = "sha256-vYled5Z9fmxuO9193lefpFzIHAiSgvYn2iOfneLidQ8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."depthai/v1-2/benchmark"}";
        }
      ];
    };
    "depthai/v1-2/benchmark" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "73d4d5e8d6d449fc8663765a42aa8aeeee844489";
        hash = "sha256-6gKLIKPnY7eXWGQcaWyPbLs3E6Q9VyqVoWoZ/u9TPY8=";
      };
    };
    "depthai/v1-3" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/luxonis/zlib/archive/refs/tags/v1.2.11-p2.tar.gz";
        hash = "sha256-AHYZF6JWbjn+iajZCg19apzcR67zhOCUtdMxpuXFjqY=";
      };
    };
    "depthai/v3" = substituteSource {
      src = fetchzip {
        name = "v3-source";
        url = "https://github.com/catchorg/Catch2/archive/refs/tags/v3.4.0.tar.gz";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
    };
  });
  meta = {
    description = "DepthAI core is a C++ library which comes with firmware and an API to interact with OAK Platform";
  };
})
