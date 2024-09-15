{
  ament_cmake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    Backward-vendor_source-v1-8 = substituteSource {
      src = fetchzip {
        name = "Backward-vendor_source-v1-8-source";
        url = "https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz";
        hash = "sha256-2k5PjwFxgA/2XPqJrPHxgSInM61FBEcieppBx+MAUKw=";
      };
      substitutions = [
      ];
    };
    CURL-vendor_source-25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-14 = substituteSource {
      src = fetchzip {
        name = "CURL-vendor_source-25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-14-source";
        url = "https://github.com/cpp-pm/curl/archive/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47.tar.gz";
        hash = "sha256-vlSBSnJ1xWC9eKAoG5TdOfD3/Lgs+4VnkMTL6x7MMt8=";
      };
      substitutions = [
      ];
    };
    Catch2-vendor_source-v3-12 = substituteSource {
      src = fetchzip {
        name = "Catch2-vendor_source-v3-12-source";
        url = "https://github.com/catchorg/Catch2/archive/refs/tags/v3.4.0.tar.gz";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
      substitutions = [
      ];
    };
    FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5 = substituteSource {
      src = fetchzip {
        name = "FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-source";
        url = "https://github.com/luxonis/FP16/archive/c911175d2717e562976e606c6e5f799bf40cf94e.tar.gz";
        hash = "sha256-4U5WmqqljHYoKdKqtFRBX++vGCv/3weuqPFr4WG7GNM=";
      };
      substitutions = [
        {
          path = "cmake/DownloadGoogleBenchmark.cmake";
          from = "URL https://github.com/google/benchmark/archive/v1.2.0.zip";
          to = "URL ${FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-v1-5}";
        }
        {
          path = "cmake/DownloadPSimd.cmake";
          from = "URL https://github.com/Maratyszcza/psimd/archive/072586a71b55b7f8c584153d223e95687148a900.tar.gz";
          to = "URL ${FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-072586a71b55b7f8c584153d223e95687148a900-6}";
        }
      ];
    };
    FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-072586a71b55b7f8c584153d223e95687148a900-6 = substituteSource {
      src = fetchzip {
        name = "FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-072586a71b55b7f8c584153d223e95687148a900-6-source";
        url = "https://github.com/Maratyszcza/psimd/archive/072586a71b55b7f8c584153d223e95687148a900.tar.gz";
        hash = "sha256-lV+VZi2b4SQlRYrhKx9Dxc6HlDEFz3newvcBjTekupo=";
      };
      substitutions = [
      ];
    };
    FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-v1-5 = substituteSource {
      src = fetchzip {
        name = "FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-v1-5-source";
        url = "https://github.com/google/benchmark/archive/v1.2.0.zip";
        hash = "sha256-iFRgjLkftuszAqBnmS9GXU8BwYnabmwMAQyw19sfjb4=";
      };
      substitutions = [
      ];
    };
    XLink-vendor_source-2b517e1cb1ca77bea17679f9fdeb739812431174-0 = substituteSource {
      src = fetchzip {
        name = "XLink-vendor_source-2b517e1cb1ca77bea17679f9fdeb739812431174-0-source";
        url = "https://github.com/luxonis/XLink/archive/2b517e1cb1ca77bea17679f9fdeb739812431174.tar.gz";
        hash = "sha256-X5VUjpblZeGHaweY1KMRIfH3zEBpfkBZXV8qesiDejU=";
      };
      substitutions = [
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${libusb-luxonis-vendor_source-b7e4548958325b18feb73977163ad44398099534-0}";
        }
      ];
    };
    ZLIB-vendor_source-v1-13 = substituteSource {
      src = fetchzip {
        name = "ZLIB-vendor_source-v1-13-source";
        url = "https://github.com/luxonis/zlib/archive/refs/tags/v1.2.11-p2.tar.gz";
        hash = "sha256-AHYZF6JWbjn+iajZCg19apzcR67zhOCUtdMxpuXFjqY=";
      };
      substitutions = [
      ];
    };
    cpr-vendor_source-50a1321738554e0152b0a6f1b0ca24e4fdecff5c-15 = substituteSource {
      src = fetchzip {
        name = "cpr-vendor_source-50a1321738554e0152b0a6f1b0ca24e4fdecff5c-15-source";
        url = "https://github.com/luxonis/cpr/archive/50a1321738554e0152b0a6f1b0ca24e4fdecff5c.tar.gz";
        hash = "sha256-qvFkVEI+5DmK1fE+U7Rm8G5NyF1wqVq0oOE2TGoQiAE=";
      };
      substitutions = [
      ];
    };
    depthai = substituteSource {
      src = fetchgit {
        name = "depthai-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "e4fd65105cdb7dada82c05670ea41fff244954d7";
        hash = "sha256-Z/nhOI5KHM7IdolX9uRSTJNKaqqzNAqU+ubBOBFkWKI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/9d9242b60d5236269f894efd3ddd60a9ca83dd7f.tar.gz\"";
          to = "URL ${depthai-vendor_source-9d9242b60d5236269f894efd3ddd60a9ca83dd7f-0}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz\"";
          to = "URL ${Backward-vendor_source-v1-8}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/catchorg/Catch2/archive/refs/tags/v3.4.0.tar.gz\"";
          to = "URL ${Catch2-vendor_source-v3-12}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/cpp-pm/curl/archive/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47.tar.gz\"";
          to = "URL ${CURL-vendor_source-25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-14}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz\"";
          to = "URL ${spdlog-vendor_source-v1-2}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/FP16/archive/c911175d2717e562976e606c6e5f799bf40cf94e.tar.gz\"";
          to = "URL ${FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/XLink/archive/2b517e1cb1ca77bea17679f9fdeb739812431174.tar.gz\"";
          to = "URL ${XLink-vendor_source-2b517e1cb1ca77bea17679f9fdeb739812431174-0}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/cpr/archive/50a1321738554e0152b0a6f1b0ca24e4fdecff5c.tar.gz\"";
          to = "URL ${cpr-vendor_source-50a1321738554e0152b0a6f1b0ca24e4fdecff5c-15}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/filesystem/archive/d29630953f3526b61842d937764f012503a79ec3.tar.gz\"";
          to = "URL ${ghc_filesystem-vendor_source-d29630953f3526b61842d937764f012503a79ec3-16}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libarchive/archive/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a.tar.gz\"";
          to = "URL ${libarchive-luxonis-vendor_source-45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-4}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libnop/archive/ab842f51dc2eb13916dc98417c2186b78320ed10.tar.gz\"";
          to = "URL ${libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${libusb-luxonis-vendor_source-b7e4548958325b18feb73977163ad44398099534-0}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/zlib/archive/refs/tags/v1.2.11-p2.tar.gz\"";
          to = "URL ${ZLIB-vendor_source-v1-13}";
        }
      ];
    };
    depthai-vendor_source-9d9242b60d5236269f894efd3ddd60a9ca83dd7f-0 = substituteSource {
      src = fetchzip {
        name = "depthai-vendor_source-9d9242b60d5236269f894efd3ddd60a9ca83dd7f-0-source";
        url = "https://github.com/cpp-pm/hunter/archive/9d9242b60d5236269f894efd3ddd60a9ca83dd7f.tar.gz";
        hash = "sha256-zd7ddxplyZccBOqWCyLeMhCysxsnRIK48ccdIks9dBA=";
      };
      substitutions = [
        {
          path = "cmake/projects/BZip2/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/bzip2/archive/v1.0.8-p0.tar.gz\"";
          to = "URL ${hunter-BZip2-1_0_8-p0}";
        }
        {
          path = "cmake/projects/BZip2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/bzip2/archive/v1.0.6-p3.tar.gz\"";
          to = "URL ${hunter-BZip2-1_0_6-p3}";
        }
        {
          path = "cmake/projects/CURL/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/curl/archive/refs/tags/v8.5.0-p0.tar.gz\"";
          to = "URL ${hunter-CURL-8_5_0-p0}";
        }
        {
          path = "cmake/projects/CURL/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz\"";
          to = "URL ${hunter-CURL-7_49_1-DEV-v8}";
        }
        {
          path = "cmake/projects/Expat/hunter.cmake";
          from = "URL\n    \"https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz\"";
          to = "URL ${hunter-Expat-2_1_1}";
        }
        {
          path = "cmake/projects/Expat/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz\"";
          to = "URL ${hunter-Expat-2_2_9-p0}";
        }
        {
          path = "cmake/projects/FP16/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz\"";
          to = "URL ${hunter-FP16-0_0_0-febbb1c-p0}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/google/googletest/archive/v1.14.0.tar.gz\"";
          to = "URL ${hunter-GTest-1_14_0}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz\"";
          to = "URL ${hunter-GTest-1_8_0-hunter-p7}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz\"";
          to = "URL ${hunter-GTest-1_7_0-hunter-6}";
        }
        {
          path = "cmake/projects/Libssh2/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/libssh2/archive/v1.9.0-p0.tar.gz\"";
          to = "URL ${hunter-Libssh2-1_9_0-p0}";
        }
        {
          path = "cmake/projects/Libssh2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/libssh2/archive/libssh2-1.7.0-hunter-4.tar.gz\"";
          to = "URL ${hunter-Libssh2-1_7_0}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz\"";
          to = "URL ${hunter-OpenSSL-1_0_2l}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://github.com/openssl/openssl/archive/OpenSSL_1_1_0f.tar.gz\"";
          to = "URL ${hunter-OpenSSL-1_1_0f}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://www.openssl.org/source/openssl-3.0.12.tar.gz\"";
          to = "URL ${hunter-OpenSSL-3_0_12}";
        }
        {
          path = "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in";
          from = ". \"@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh\" && ";
          to = "";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/zlib/archive/refs/tags/v1.3.0-p0.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_3_0-p0}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_2_8-p3}";
        }
        {
          path = "cmake/projects/fmt/hunter.cmake";
          from = "URL\n    \"https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz\"";
          to = "URL ${hunter-fmt-10_1_1}";
        }
        {
          path = "cmake/projects/fmt/hunter.cmake";
          from = "URL\n    \"https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz\"";
          to = "URL ${hunter-fmt-4_0_0}";
        }
        {
          path = "cmake/projects/intsizeof/hunter.cmake";
          from = "URL\n    \"https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz\"";
          to = "URL ${hunter-intsizeof-2_0_1}";
        }
        {
          path = "cmake/projects/intsizeof/hunter.cmake";
          from = "URL\n    \"https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz\"";
          to = "URL ${hunter-intsizeof-2_0_2}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/julianoes/jsoncpp/archive/refs/tags/1.9.5-b1.tar.gz\"";
          to = "URL ${hunter-jsoncpp-1_9_5-b1}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz\"";
          to = "URL ${hunter-jsoncpp-0_7_0}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/open-source-parsers/jsoncpp/archive/1.8.0.tar.gz\"";
          to = "URL ${hunter-jsoncpp-1_8_0}";
        }
        {
          path = "cmake/projects/libxml2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz\"";
          to = "URL ${hunter-libxml2-2_9_7-p0}";
        }
        {
          path = "cmake/projects/lz4/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz\"";
          to = "URL ${hunter-lz4-1_9_2-p0}";
        }
        {
          path = "cmake/projects/lzma/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz\"";
          to = "URL ${hunter-lzma-5_2_3-p4}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz\"";
          to = "URL ${hunter-nlohmann_json-2_1_1-p1}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.11.2.tar.gz\"";
          to = "URL ${hunter-nlohmann_json-3_11_2}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.9.1.tar.gz\"";
          to = "URL ${hunter-nlohmann_json-3_9_1}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/spdlog/archive/v1.12.0-p0.tar.gz\"";
          to = "URL ${hunter-spdlog-1_12_0-p0}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/spdlog/archive/v0.13.0-p1.tar.gz\"";
          to = "URL ${hunter-spdlog-0_13_0-p1}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz\"";
          to = "URL ${hunter-spdlog-1_0_0-p0}";
        }
        {
          path = "cmake/projects/zstd/hunter.cmake";
          from = "URL\n    \"https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz\"";
          to = "URL ${hunter-zstd-1_5_5}";
        }
      ];
    };
    ghc_filesystem-vendor_source-d29630953f3526b61842d937764f012503a79ec3-16 = substituteSource {
      src = fetchzip {
        name = "ghc_filesystem-vendor_source-d29630953f3526b61842d937764f012503a79ec3-16-source";
        url = "https://github.com/luxonis/filesystem/archive/d29630953f3526b61842d937764f012503a79ec3.tar.gz";
        hash = "sha256-3DRJIHQpHhUWr65IMizfO/vuEJHXXU9DKSECG093FgM=";
      };
      substitutions = [
      ];
    };
    hunter-BZip2-1_0_6-p3 = substituteSource {
      src = fetchzip {
        name = "hunter-BZip2-1_0_6-p3-source";
        url = "https://github.com/hunter-packages/bzip2/archive/v1.0.6-p3.tar.gz";
        hash = "sha256-P9O19T1JNI+9fEFnJ1ye2NOEKZlNrn0JldCNnEyXH+w=";
      };
      substitutions = [
      ];
    };
    hunter-BZip2-1_0_8-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-BZip2-1_0_8-p0-source";
        url = "https://github.com/cpp-pm/bzip2/archive/v1.0.8-p0.tar.gz";
        hash = "sha256-vb++9wk5te3iMdmyDkm/UAS/2G+wWex8iSZyMaGHs18=";
      };
      substitutions = [
      ];
    };
    hunter-CURL-7_49_1-DEV-v8 = substituteSource {
      src = fetchzip {
        name = "hunter-CURL-7_49_1-DEV-v8-source";
        url = "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz";
        hash = "sha256-AydgS3/18V19MQLVHeGcywN7u509/PpZ3VSKFNlmyo4=";
      };
      substitutions = [
      ];
    };
    hunter-CURL-8_5_0-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-CURL-8_5_0-p0-source";
        url = "https://github.com/cpp-pm/curl/archive/refs/tags/v8.5.0-p0.tar.gz";
        hash = "sha256-t43zsxtkdYTn66cw69SMI5RlLXQMaQnWW/tB5mJUddw=";
      };
      substitutions = [
      ];
    };
    hunter-Expat-2_1_1 = substituteSource {
      src = fetchzip {
        name = "hunter-Expat-2_1_1-source";
        url = "https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz";
        hash = "sha256-tHNOmb+8qggdJQp1ZC6JJ9Tkvh3QLUWZvK0jDM0zmX8=";
      };
      substitutions = [
      ];
    };
    hunter-Expat-2_2_9-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-Expat-2_2_9-p0-source";
        url = "https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz";
        hash = "sha256-lUECusiwUIXSA6zHm2qSjptcnMGyK6IkM3GErfxIKfg=";
      };
      substitutions = [
      ];
    };
    hunter-FP16-0_0_0-febbb1c-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-FP16-0_0_0-febbb1c-p0-source";
        url = "https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz";
        hash = "sha256-AFlV31tc0xDbr5eqWPxv8Uj3vvXR3X1ChBBOTuF6VIo=";
      };
      substitutions = [
        {
          path = "cmake/DownloadGoogleBenchmark.cmake";
          from = "URL https://github.com/google/benchmark/archive/v1.2.0.zip";
          to = "URL ${FP16-vendor_source-c911175d2717e562976e606c6e5f799bf40cf94e-5-vendor_source-v1-5}";
        }
        {
          path = "cmake/DownloadPSimd.cmake";
          from = "GIT_REPOSITORY https://github.com/Maratyszcza/psimd.git";
          to = "URL ${hunter-FP16-0_0_0-febbb1c-p0-vendor_source-psimd-23}";
        }
      ];
    };
    hunter-FP16-0_0_0-febbb1c-p0-vendor_source-psimd-23 = substituteSource {
      src = fetchgit {
        name = "hunter-FP16-0_0_0-febbb1c-p0-vendor_source-psimd-23-source";
        url = "https://github.com/Maratyszcza/psimd.git";
        rev = "072586a71b55b7f8c584153d223e95687148a900";
        hash = "sha256-lV+VZi2b4SQlRYrhKx9Dxc6HlDEFz3newvcBjTekupo=";
      };
      substitutions = [
      ];
    };
    hunter-GTest-1_14_0 = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_14_0-source";
        url = "https://github.com/google/googletest/archive/v1.14.0.tar.gz";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
      substitutions = [
      ];
    };
    hunter-GTest-1_7_0-hunter-6 = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_7_0-hunter-6-source";
        url = "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz";
        hash = "sha256-s4gpAVc8dVgwPFD4QANFeKfwIwymRsJSUzpnkW+tOkU=";
      };
      substitutions = [
      ];
    };
    hunter-GTest-1_8_0-hunter-p7 = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_8_0-hunter-p7-source";
        url = "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz";
        hash = "sha256-3UKXA2WpIDUT7UujipX0DVQcbzmyccvh2Woc7Hs954I=";
      };
      substitutions = [
      ];
    };
    hunter-Libssh2-1_7_0 = substituteSource {
      src = fetchzip {
        name = "hunter-Libssh2-1_7_0-source";
        url = "https://github.com/hunter-packages/libssh2/archive/libssh2-1.7.0-hunter-4.tar.gz";
        hash = "sha256-qPqJteirsrPuXRiNXpDx1WYamClQRc40CAFYnNz0FrE=";
      };
      substitutions = [
      ];
    };
    hunter-Libssh2-1_9_0-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-Libssh2-1_9_0-p0-source";
        url = "https://github.com/cpp-pm/libssh2/archive/v1.9.0-p0.tar.gz";
        hash = "sha256-DB6kbXQrpsqq8dJasrVzTTU2IfR9PImkOPQuL/v3BHA=";
      };
      substitutions = [
      ];
    };
    hunter-OpenSSL-1_0_2l = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-1_0_2l-source";
        url = "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz";
        hash = "sha256-KTgrY40My0QDHpQNUCZhjTqKWz27apiiWcL8gYk3HMA=";
      };
      substitutions = [
      ];
    };
    hunter-OpenSSL-1_1_0f = substituteSource {
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
    hunter-OpenSSL-3_0_12 = substituteSource {
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
    hunter-ZLIB-1_2_8-p3 = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_8-p3-source";
        url = "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz";
        hash = "sha256-KwMG0+z2gFWLCY1vuIf9dZR5NrEDpl8earBxWHeYJzE=";
      };
      substitutions = [
      ];
    };
    hunter-ZLIB-1_3_0-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_3_0-p0-source";
        url = "https://github.com/cpp-pm/zlib/archive/refs/tags/v1.3.0-p0.tar.gz";
        hash = "sha256-D07tEFsScfn4Vf/p/jlyR+Dn+9X6d9Oti6r/7YDqxBg=";
      };
      substitutions = [
      ];
    };
    hunter-fmt-10_1_1 = substituteSource {
      src = fetchzip {
        name = "hunter-fmt-10_1_1-source";
        url = "https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz";
        hash = "sha256-H9+1lEaHM12nzXSmo9m8S6527t+97e6necayyjCPm1A=";
      };
      substitutions = [
      ];
    };
    hunter-fmt-4_0_0 = substituteSource {
      src = fetchzip {
        name = "hunter-fmt-4_0_0-source";
        url = "https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz";
        hash = "sha256-KgGMeTgVR4lBUbYiy/2yQY9jaBeovldfDTmihPl2+Ds=";
      };
      substitutions = [
      ];
    };
    hunter-intsizeof-2_0_1 = substituteSource {
      src = fetchzip {
        name = "hunter-intsizeof-2_0_1-source";
        url = "https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz";
        hash = "sha256-le9EGCO9wdDFxzVm6SWbWq2G76D+5no1ftXB83wyJ6I=";
      };
      substitutions = [
      ];
    };
    hunter-intsizeof-2_0_2 = substituteSource {
      src = fetchzip {
        name = "hunter-intsizeof-2_0_2-source";
        url = "https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz";
        hash = "sha256-qjc7wEWTpYyrkltM+Y9Ibs4zkNZZd5bfD2lz2VfFS3c=";
      };
      substitutions = [
      ];
    };
    hunter-jsoncpp-0_7_0 = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-0_7_0-source";
        url = "https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz";
        hash = "sha256-yV/i+rI7L77vtXb9WU+HSSx8WK7k/0Z0NqHMrVahBzY=";
      };
      substitutions = [
      ];
    };
    hunter-jsoncpp-1_8_0 = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-1_8_0-source";
        url = "https://github.com/open-source-parsers/jsoncpp/archive/1.8.0.tar.gz";
        hash = "sha256-LVHZ0Qu3JtR422i+563/y03RujjfccBX6CBQK/MX4tE=";
      };
      substitutions = [
      ];
    };
    hunter-jsoncpp-1_9_5-b1 = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-1_9_5-b1-source";
        url = "https://github.com/julianoes/jsoncpp/archive/refs/tags/1.9.5-b1.tar.gz";
        hash = "sha256-VjzW4vW+5CgrBPgTxk9ocR2HkRqt3emKoBukiGuuTHM=";
      };
      substitutions = [
      ];
    };
    hunter-libxml2-2_9_7-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-libxml2-2_9_7-p0-source";
        url = "https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz";
        hash = "sha256-2C/LaRqpnzajrPKrS/HPTqOT+Qj3oYmdwLTyS+0mzoM=";
      };
      substitutions = [
      ];
    };
    hunter-lz4-1_9_2-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-lz4-1_9_2-p0-source";
        url = "https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz";
        hash = "sha256-j1HRy07iKu1Y54fuRyqEEsvMS/mHhBiJuwQBbvoIbtw=";
      };
      substitutions = [
      ];
    };
    hunter-lzma-5_2_3-p4 = substituteSource {
      src = fetchzip {
        name = "hunter-lzma-5_2_3-p4-source";
        url = "https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz";
        hash = "sha256-DnjVgMJR5Ty9rcwM6fCQ9h+yLPFoDy6QE5Kkrhg62go=";
      };
      substitutions = [
      ];
    };
    hunter-nlohmann_json-2_1_1-p1 = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
      substitutions = [
      ];
    };
    hunter-nlohmann_json-3_11_2 = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_11_2-source";
        url = "https://github.com/nlohmann/json/archive/v3.11.2.tar.gz";
        hash = "sha256-SUdhIV7tjtacf5DkoWk9cnkfyMlrkg8ZU7XnPZd22Tw=";
      };
      substitutions = [
      ];
    };
    hunter-nlohmann_json-3_9_1 = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_9_1-source";
        url = "https://github.com/nlohmann/json/archive/v3.9.1.tar.gz";
        hash = "sha256-THordDPdH2qwk6lFTgeFmkl7iDuA/7YH71PTUe6vJCs=";
      };
      substitutions = [
      ];
    };
    hunter-spdlog-0_13_0-p1 = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-0_13_0-p1-source";
        url = "https://github.com/hunter-packages/spdlog/archive/v0.13.0-p1.tar.gz";
        hash = "sha256-Du5Fy/C92MqpmeR45+8UwK4pGOjP1FXbcYm64YvSQLE=";
      };
      substitutions = [
      ];
    };
    hunter-spdlog-1_0_0-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-1_0_0-p0-source";
        url = "https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz";
        hash = "sha256-BgF4bHwnQcSU80a28JZipNc5QP9hbOiDi4u4utmRIqs=";
      };
      substitutions = [
      ];
    };
    hunter-spdlog-1_12_0-p0 = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-1_12_0-p0-source";
        url = "https://github.com/cpp-pm/spdlog/archive/v1.12.0-p0.tar.gz";
        hash = "sha256-3N5Iq9o8aenRiBjvuDNuSqK780h5PMLF/Fg/8y93W+8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44}";
        }
      ];
    };
    hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44 = substituteSource {
      src = fetchgit {
        name = "hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
      substitutions = [
      ];
    };
    hunter-zstd-1_5_5 = substituteSource {
      src = fetchzip {
        name = "hunter-zstd-1_5_5-source";
        url = "https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
      substitutions = [
      ];
    };
    libarchive-luxonis-vendor_source-45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-4 = substituteSource {
      src = fetchzip {
        name = "libarchive-luxonis-vendor_source-45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-4-source";
        url = "https://github.com/luxonis/libarchive/archive/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a.tar.gz";
        hash = "sha256-6KTBpL1ibQAwRdzcan+qPhV5cNPHlxwhPJ+swOwJ92g=";
      };
      substitutions = [
      ];
    };
    libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9 = substituteSource {
      src = fetchzip {
        name = "libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-source";
        url = "https://github.com/luxonis/libnop/archive/ab842f51dc2eb13916dc98417c2186b78320ed10.tar.gz";
        hash = "sha256-d2z/lDI9pe5TR82MxGkR9bBMNXPvzqb9Gsd5jOv6x1A=";
      };
      substitutions = [
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googlemock.git\"";
          to = "URL ${libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-vendor_source-googlemock-10}";
        }
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googletest.git\"";
          to = "URL ${libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-vendor_source-googletest-9}";
        }
      ];
    };
    libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-vendor_source-googlemock-10 = substituteSource {
      src = fetchgit {
        name = "libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-vendor_source-googlemock-10-source";
        url = "https://github.com/google/googlemock.git";
        rev = "778dc88acb34184f7c1e9208dac338dd4cd2aaf8";
        hash = "sha256-7KdgGz+dVi1AT/4pHt00wP2AtQJbZyjrYLhLMCsyb30=";
      };
      substitutions = [
      ];
    };
    libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-vendor_source-googletest-9 = substituteSource {
      src = fetchgit {
        name = "libnop-vendor_source-ab842f51dc2eb13916dc98417c2186b78320ed10-9-vendor_source-googletest-9-source";
        url = "https://github.com/google/googletest.git";
        rev = "6d1deeb565be215554ee28f0ec9c1ed0b12afa8e";
        hash = "sha256-w2JP5XDUPzyOtf6OY/UFkARa5X5w66W/IRnUAQ3Jg0s=";
      };
      substitutions = [
      ];
    };
    libusb-luxonis-vendor_source-b7e4548958325b18feb73977163ad44398099534-0 = substituteSource {
      src = fetchzip {
        name = "libusb-luxonis-vendor_source-b7e4548958325b18feb73977163ad44398099534-0-source";
        url = "https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz";
        hash = "sha256-DjT7ooqQeRIXt2pRwznaT7twpzOVAea62ngJk1y2mUI=";
      };
      substitutions = [
      ];
    };
    spdlog-vendor_source-v1-2 = substituteSource {
      src = fetchzip {
        name = "spdlog-vendor_source-v1-2-source";
        url = "https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
        hash = "sha256-vYled5Z9fmxuO9193lefpFzIHAiSgvYn2iOfneLidQ8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${spdlog-vendor_source-v1-2-vendor_source-benchmark-2}";
        }
      ];
    };
    spdlog-vendor_source-v1-2-vendor_source-benchmark-2 = substituteSource {
      src = fetchgit {
        name = "spdlog-vendor_source-v1-2-vendor_source-benchmark-2-source";
        url = "https://github.com/google/benchmark.git";
        rev = "73d4d5e8d6d449fc8663765a42aa8aeeee844489";
        hash = "sha256-6gKLIKPnY7eXWGQcaWyPbLs3E6Q9VyqVoWoZ/u9TPY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai";
  version = "2.28.0-1";
  src = sources.depthai;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "libusb-1.0-dev" "nlohmann-json-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "DepthAI core is a C++ library which comes with firmware and an API to interact with OAK Platform";
  };
}
