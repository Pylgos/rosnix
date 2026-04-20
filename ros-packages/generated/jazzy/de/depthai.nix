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
  version = "2.31.1-1";
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
        rev = "efce03c1852474628c67973486c4de69d5e70717";
        hash = "sha256-Jz4iOyD2i/0i/0kpMQxvu+lDBK9gd9vz0NM2pAWCJ1I=";
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
          from = "URL \"https://github.com/luxonis/XLink/archive/b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba.tar.gz\"";
          to = "URL ${sources."depthai/b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba"}";
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
          path = "cmake/projects/mongoose/hunter.cmake";
          from = "URL\n    https://github.com/hunter-packages/mongoose/archive/5.6-p.tar.gz";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-mongoose-5_6"}";
        }
        {
          path = "cmake/projects/mongoose/hunter.cmake";
          from = "URL\n    https://github.com/hunter-packages/mongoose/archive/6.10-p.tar.gz";
          to = "URL ${sources."depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-mongoose-6_10"}";
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
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-mongoose-5_6" = substituteSource {
      src = fetchzip {
        name = "hunter-mongoose-5_6-source";
        url = "https://github.com/hunter-packages/mongoose/archive/5.6-p.tar.gz";
        hash = "sha256-K4LnyXDd2Z+D5G2tYXIyC0AdjqRxUFG49lQAeU0iF6A=";
      };
    };
    "depthai/9d9242b60d5236269f894efd3ddd60a9ca83dd7f/hunter-mongoose-6_10" = substituteSource {
      src = fetchzip {
        name = "hunter-mongoose-6_10-source";
        url = "https://github.com/hunter-packages/mongoose/archive/6.10-p.tar.gz";
        hash = "sha256-fWcEHSOx/UESrKz/NK7T6fMrfnn1Ljn4cxtx6oo0LRg=";
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
          from = "GIT_REPOSITORY \"https://github.com/google/googletest.git\"";
          to = "URL ${sources."depthai/ab842f51dc2eb13916dc98417c2186b78320ed10/googletest"}";
        }
      ];
    };
    "depthai/ab842f51dc2eb13916dc98417c2186b78320ed10/googletest" = substituteSource {
      src = fetchgit {
        name = "googletest-source";
        url = "https://github.com/google/googletest.git";
        rev = "6d1deeb565be215554ee28f0ec9c1ed0b12afa8e";
        hash = "sha256-w2JP5XDUPzyOtf6OY/UFkARa5X5w66W/IRnUAQ3Jg0s=";
      };
    };
    "depthai/b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba" = substituteSource {
      src = fetchzip {
        name = "b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba-source";
        url = "https://github.com/luxonis/XLink/archive/b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba.tar.gz";
        hash = "sha256-NMulJ+lrxmV853G837LomXticIZRJMVcah9YgMqD0cU=";
      };
      substitutions = [
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${sources."depthai/b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba/b7e4548958325b18feb73977163ad44398099534"}";
        }
      ];
    };
    "depthai/b0be8f9d9d24eac43fbe4ac9313f9afe425c6dba/b7e4548958325b18feb73977163ad44398099534" = substituteSource {
      src = fetchzip {
        name = "b7e4548958325b18feb73977163ad44398099534-source";
        url = "https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz";
        hash = "sha256-DjT7ooqQeRIXt2pRwznaT7twpzOVAea62ngJk1y2mUI=";
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
