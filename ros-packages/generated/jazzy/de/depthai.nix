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
    _072586a71b55b7f8c584153d223e95687148a900-vendor_source-16mslhvqs0gpqbg7kkq566a8gkn58cgjpqca8ljj9qcv5mk9apwm = substituteSource {
      src = fetchzip {
        name = "_072586a71b55b7f8c584153d223e95687148a900-vendor_source-16mslhvqs0gpqbg7kkq566a8gkn58cgjpqca8ljj9qcv5mk9apwm-source";
        url = "https://github.com/Maratyszcza/psimd/archive/072586a71b55b7f8c584153d223e95687148a900.tar.gz";
        hash = "sha256-lV+VZi2b4SQlRYrhKx9Dxc6HlDEFz3newvcBjTekupo=";
      };
      substitutions = [
      ];
    };
    _25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-vendor_source-1prjrhgfpjy4j1kqbyrcp3yggw1rvna1na50g2yn1ibmf9582m5y = substituteSource {
      src = fetchzip {
        name = "_25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-vendor_source-1prjrhgfpjy4j1kqbyrcp3yggw1rvna1na50g2yn1ibmf9582m5y-source";
        url = "https://github.com/cpp-pm/curl/archive/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47.tar.gz";
        hash = "sha256-vlSBSnJ1xWC9eKAoG5TdOfD3/Lgs+4VnkMTL6x7MMt8=";
      };
      substitutions = [
      ];
    };
    _2b517e1cb1ca77bea17679f9fdeb739812431174-vendor_source-0dbshg47lajzbmcl0zk9836ggw9126ix9607df3y2rg5js7595az = substituteSource {
      src = fetchzip {
        name = "_2b517e1cb1ca77bea17679f9fdeb739812431174-vendor_source-0dbshg47lajzbmcl0zk9836ggw9126ix9607df3y2rg5js7595az-source";
        url = "https://github.com/luxonis/XLink/archive/2b517e1cb1ca77bea17679f9fdeb739812431174.tar.gz";
        hash = "sha256-X5VUjpblZeGHaweY1KMRIfH3zEBpfkBZXV8qesiDejU=";
      };
      substitutions = [
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${b7e4548958325b18feb73977163ad44398099534-vendor_source-0hlrnrf962bqvaxfc0cm6fkp1fsgv8ww6lbanwbi4ychiaignd0f}";
        }
      ];
    };
    _45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-vendor_source-0s7p17nc1b4z7hhir5y7sdq7j59ym9znmp6w8lq00vb2pnjc3978 = substituteSource {
      src = fetchzip {
        name = "_45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-vendor_source-0s7p17nc1b4z7hhir5y7sdq7j59ym9znmp6w8lq00vb2pnjc3978-source";
        url = "https://github.com/luxonis/libarchive/archive/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a.tar.gz";
        hash = "sha256-6KTBpL1ibQAwRdzcan+qPhV5cNPHlxwhPJ+swOwJ92g=";
      };
      substitutions = [
      ];
    };
    _50a1321738554e0152b0a6f1b0ca24e4fdecff5c-vendor_source-00c821m4qdp1l2s5mabhbp44svphcss56gpisn53kr1y89a69wda = substituteSource {
      src = fetchzip {
        name = "_50a1321738554e0152b0a6f1b0ca24e4fdecff5c-vendor_source-00c821m4qdp1l2s5mabhbp44svphcss56gpisn53kr1y89a69wda-source";
        url = "https://github.com/luxonis/cpr/archive/50a1321738554e0152b0a6f1b0ca24e4fdecff5c.tar.gz";
        hash = "sha256-qvFkVEI+5DmK1fE+U7Rm8G5NyF1wqVq0oOE2TGoQiAE=";
      };
      substitutions = [
      ];
    };
    _9d9242b60d5236269f894efd3ddd60a9ca83dd7f-vendor_source-043l7m5j47f7y6w84i173frv441jvqi0p5pa0hf9gjb539vxvpnd = substituteSource {
      src = fetchzip {
        name = "_9d9242b60d5236269f894efd3ddd60a9ca83dd7f-vendor_source-043l7m5j47f7y6w84i173frv441jvqi0p5pa0hf9gjb539vxvpnd-source";
        url = "https://github.com/cpp-pm/hunter/archive/9d9242b60d5236269f894efd3ddd60a9ca83dd7f.tar.gz";
        hash = "sha256-zd7ddxplyZccBOqWCyLeMhCysxsnRIK48ccdIks9dBA=";
      };
      substitutions = [
        {
          path = "cmake/projects/BZip2/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/bzip2/archive/v1.0.8-p0.tar.gz\"";
          to = "URL ${hunter-BZip2-1_0_8-p0-0pxkhyhk2wi6i5yfqndhdzcby12hpx4hxcnr67ifvd9r17vvxgxx}";
        }
        {
          path = "cmake/projects/BZip2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/bzip2/archive/v1.0.6-p3.tar.gz\"";
          to = "URL ${hunter-BZip2-1_0_6-p3-1v0zjx69r3fhjl4pvbjdk4lq9lyqkrf2frs1gjyqyd297psvblrz}";
        }
        {
          path = "cmake/projects/CURL/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/curl/archive/refs/tags/v8.5.0-p0.tar.gz\"";
          to = "URL ${hunter-CURL-8_5_0-p0-1p3maiifchgvbgb0js8cfhnnb513ikafnc57xgkq8xb43frz73dp}";
        }
        {
          path = "cmake/projects/CURL/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz\"";
          to = "URL ${hunter-CURL-7_49_1-DEV-v8-13nacvci92jlvmczmz1xknxpn0ybkkhivm8265ymvwgmgx5n09q3}";
        }
        {
          path = "cmake/projects/Expat/hunter.cmake";
          from = "URL\n    \"https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz\"";
          to = "URL ${hunter-Expat-2_1_1-0zwr6g6hq8xdpjclabfh3nzf9m17i4p68x8a4lfhiamwpyclwwxl}";
        }
        {
          path = "cmake/projects/Expat/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz\"";
          to = "URL ${hunter-Expat-2_2_9-p0-1y1993yav13i6cja4axjq6f5r6wfj9m9pixc0g98al5hr2x04hcm}";
        }
        {
          path = "cmake/projects/FP16/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz\"";
          to = "URL ${hunter-FP16-0_0_0-febbb1c-p0-12jlgbhlwkhhhi17vpfiynzgfj7idzy5ialpmzdi1lswbggman80}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/google/googletest/archive/v1.14.0.tar.gz\"";
          to = "URL ${hunter-GTest-1_14_0-19c7f248rkg302yrbl5x7irfyi6a9whbpf45wn4bn9fk0625qi5p}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz\"";
          to = "URL ${hunter-GTest-1_8_0-hunter-p7-10p77mxyq73av7hwnwdj75piqm0dyjaqm8sbxl9ka859cl1rfhnx}";
        }
        {
          path = "cmake/projects/GTest/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz\"";
          to = "URL ${hunter-GTest-1_7_0-hunter-6-0i9smmpr2rrsad9c4im61hiz19vq8l1l1y2h7hq5hx9waw0jk25k}";
        }
        {
          path = "cmake/projects/Libssh2/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/libssh2/archive/v1.9.0-p0.tar.gz\"";
          to = "URL ${hunter-Libssh2-1_9_0-p0-0w04yzxjybpl72j8jg3xyhhkcdadffsv4nnjy6mcm9ibfins87hc}";
        }
        {
          path = "cmake/projects/Libssh2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/libssh2/archive/libssh2-1.7.0-hunter-4.tar.gz\"";
          to = "URL ${hunter-Libssh2-1_7_0-1c8nykf9qn0110scwiah56c1lrnmy685x38qbppb7cmbx2sqkym8}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz\"";
          to = "URL ${hunter-OpenSSL-1_0_2l-1h0w6y4q3z62b6i9hsmv7mdqlfldc4k503cl3q1l9jqcimijnf19}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://github.com/openssl/openssl/archive/OpenSSL_1_1_0f.tar.gz\"";
          to = "URL ${hunter-OpenSSL-1_1_0f-1c6wdwr3vyfp0d9k81b4v2rj503qqv0qd92iwl0lz54xd7l0jk1q}";
        }
        {
          path = "cmake/projects/OpenSSL/hunter.cmake";
          from = "URL\n    \"https://www.openssl.org/source/openssl-3.0.12.tar.gz\"";
          to = "URL ${hunter-OpenSSL-3_0_12-1c23rgrhjqba4w1lc3awgfm88i176752aj492k2cn6wfz6yy1r2h}";
        }
        {
          path = "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in";
          from = ". \"@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh\" && ";
          to = "";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/zlib/archive/refs/tags/v1.3.0-p0.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_3_0-p0-0664xa0fvzxaifnx6xzsspxygq27f8wzxsgzapwgjw8jbc8fskhg}";
        }
        {
          path = "cmake/projects/ZLIB/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz\"";
          to = "URL ${hunter-ZLIB-1_2_8-p3-0c97k1vmhwdhd8g5z9h3n4v7k53mzn3vhvwd165mb07nxk9hc0rb}";
        }
        {
          path = "cmake/projects/fmt/hunter.cmake";
          from = "URL\n    \"https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz\"";
          to = "URL ${hunter-fmt-10_1_1-0l4viwqcmcn6g6kyxvdxvzp7dbjbpkcs79klrnkmscw78sabbpqz}";
        }
        {
          path = "cmake/projects/fmt/hunter.cmake";
          from = "URL\n    \"https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz\"";
          to = "URL ${hunter-fmt-4_0_0-0fzqfvwq98ir1mgmggm82xl673s1nbywn8mna50qjiqm71wqq09a}";
        }
        {
          path = "cmake/projects/intsizeof/hunter.cmake";
          from = "URL\n    \"https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz\"";
          to = "URL ${hunter-intsizeof-2_0_1-18i769yg7hfmgqspmrpyl3pqdbaskcjyjrimqz2x1hdx4cc49vwm}";
        }
        {
          path = "cmake/projects/intsizeof/hunter.cmake";
          from = "URL\n    \"https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz\"";
          to = "URL ${hunter-intsizeof-2_0_2-0xsbqmbxjwv91zgrcxsrss837kkf927zjk2vjamqr9ck8p03ndxa}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/julianoes/jsoncpp/archive/refs/tags/1.9.5-b1.tar.gz\"";
          to = "URL ${hunter-jsoncpp-1_9_5-b1-0wscmrmqi90vl25fkpdd3a8qf7bid17wc4zq0hmjir5yypidcg2n}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz\"";
          to = "URL ${hunter-jsoncpp-0_7_0-0dh7l5bavk516rs4dzz4mrc7qb29hx7mkzbnnppvwbrvnbxf4py9}";
        }
        {
          path = "cmake/projects/jsoncpp/hunter.cmake";
          from = "URL\n    \"https://github.com/open-source-parsers/jsoncpp/archive/1.8.0.tar.gz\"";
          to = "URL ${hunter-jsoncpp-1_8_0-1lg22zrjnl10x1bw0wfz72xd2kfbzynyggk8vdwd89mp1g8xjl9d}";
        }
        {
          path = "cmake/projects/libxml2/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz\"";
          to = "URL ${hunter-libxml2-2_9_7-p0-10yf4vnlpwmlq2fqk8gp13wr78sfrzqlpazjmjikd7x939lwnbyq}";
        }
        {
          path = "cmake/projects/lz4/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz\"";
          to = "URL ${hunter-lz4-1_9_2-p0-1p3f13x6w084pf4ii147z55wrjqjhhm4gvl7wxcfsap29v5x2lcg}";
        }
        {
          path = "cmake/projects/lzma/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz\"";
          to = "URL ${hunter-lzma-5_2_3-p4-02ns78cax94j2f82w3v8y4nb47znj3qfj36cmnykrraiqa0day0f}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz\"";
          to = "URL ${hunter-nlohmann_json-2_1_1-p1-1gnybpdk9wwzrlq7ys4a8zj0a0115aw6rg0k32frhkd5nzjis1pa}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.11.2.tar.gz\"";
          to = "URL ${hunter-nlohmann_json-3_11_2-0g6rfsbkvrxmacchz4kbr741yybj7mls3r4hgyfdd3pdbqhn2is9}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.9.1.tar.gz\"";
          to = "URL ${hunter-nlohmann_json-3_9_1-0ar4mzp53lskxw3vdzw07f47njcshl3lwid9jfq6l7yx6ds2nyjc}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/cpp-pm/spdlog/archive/v1.12.0-p0.tar.gz\"";
          to = "URL ${hunter-spdlog-1_12_0-p0-1vsvfwpz6gsqzk2w4g3r93rvp8jadqrvivqqi38yjs9wvamlipnw}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/spdlog/archive/v0.13.0-p1.tar.gz\"";
          to = "URL ${hunter-spdlog-0_13_0-p1-1ca0sa5y3fl9f7dmbm6gx0c2kbn02kpyfy74k6lwmn5xy35lbvhf}";
        }
        {
          path = "cmake/projects/spdlog/hunter.cmake";
          from = "URL\n    \"https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz\"";
          to = "URL ${hunter-spdlog-1_0_0-p0-1ar2j7cvmf4bif1yhv31zx03kmx4cabg1dj6yfac8h97gin7h086}";
        }
        {
          path = "cmake/projects/zstd/hunter.cmake";
          from = "URL\n    \"https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz\"";
          to = "URL ${hunter-zstd-1_5_5-0x3n97hx5x68fa7jz674rkabaaji1bijcqdm99rg5vhlqhicfwdl}";
        }
      ];
    };
    ab842f51dc2eb13916dc98417c2186b78320ed10-vendor_source-0l67zbmqqyf73bysdkpgfcslrc7m25lw936d8x9yx99x6aagyv3p = substituteSource {
      src = fetchzip {
        name = "ab842f51dc2eb13916dc98417c2186b78320ed10-vendor_source-0l67zbmqqyf73bysdkpgfcslrc7m25lw936d8x9yx99x6aagyv3p-source";
        url = "https://github.com/luxonis/libnop/archive/ab842f51dc2eb13916dc98417c2186b78320ed10.tar.gz";
        hash = "sha256-d2z/lDI9pe5TR82MxGkR9bBMNXPvzqb9Gsd5jOv6x1A=";
      };
      substitutions = [
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googlemock.git\"";
          to = "URL ${googlemock-vendor_source-778dc88acb34184f7c1e9208dac338dd4cd2aaf8}";
        }
        {
          path = "cmake/modules/FindGMock.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/googletest.git\"";
          to = "URL ${googletest-vendor_source-6d1deeb565be215554ee28f0ec9c1ed0b12afa8e}";
        }
      ];
    };
    b7e4548958325b18feb73977163ad44398099534-vendor_source-0hlrnrf962bqvaxfc0cm6fkp1fsgv8ww6lbanwbi4ychiaignd0f = substituteSource {
      src = fetchzip {
        name = "b7e4548958325b18feb73977163ad44398099534-vendor_source-0hlrnrf962bqvaxfc0cm6fkp1fsgv8ww6lbanwbi4ychiaignd0f-source";
        url = "https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz";
        hash = "sha256-DjT7ooqQeRIXt2pRwznaT7twpzOVAea62ngJk1y2mUI=";
      };
      substitutions = [
      ];
    };
    benchmark-vendor_source-73d4d5e8d6d449fc8663765a42aa8aeeee844489 = substituteSource {
      src = fetchgit {
        name = "benchmark-vendor_source-73d4d5e8d6d449fc8663765a42aa8aeeee844489-source";
        url = "https://github.com/google/benchmark.git";
        rev = "73d4d5e8d6d449fc8663765a42aa8aeeee844489";
        hash = "sha256-6gKLIKPnY7eXWGQcaWyPbLs3E6Q9VyqVoWoZ/u9TPY8=";
      };
      substitutions = [
      ];
    };
    benchmark-vendor_source-f91b6b42b1b9854772a90ae9501464a161707d1e = substituteSource {
      src = fetchgit {
        name = "benchmark-vendor_source-f91b6b42b1b9854772a90ae9501464a161707d1e-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
      substitutions = [
      ];
    };
    c911175d2717e562976e606c6e5f799bf40cf94e-vendor_source-1lqqpdhy2szim2p0gpzz5ccazvsz85ab9anj54l7d355mad5ckp1 = substituteSource {
      src = fetchzip {
        name = "c911175d2717e562976e606c6e5f799bf40cf94e-vendor_source-1lqqpdhy2szim2p0gpzz5ccazvsz85ab9anj54l7d355mad5ckp1-source";
        url = "https://github.com/luxonis/FP16/archive/c911175d2717e562976e606c6e5f799bf40cf94e.tar.gz";
        hash = "sha256-4U5WmqqljHYoKdKqtFRBX++vGCv/3weuqPFr4WG7GNM=";
      };
      substitutions = [
        {
          path = "cmake/DownloadGoogleBenchmark.cmake";
          from = "URL https://github.com/google/benchmark/archive/v1.2.0.zip";
          to = "URL ${v1-vendor_source-1gld3zdxgc0c0466qvnsi70h2ksx8qprjrx008rypdhzp6660m48}";
        }
        {
          path = "cmake/DownloadPSimd.cmake";
          from = "URL https://github.com/Maratyszcza/psimd/archive/072586a71b55b7f8c584153d223e95687148a900.tar.gz";
          to = "URL ${_072586a71b55b7f8c584153d223e95687148a900-vendor_source-16mslhvqs0gpqbg7kkq566a8gkn58cgjpqca8ljj9qcv5mk9apwm}";
        }
      ];
    };
    d29630953f3526b61842d937764f012503a79ec3-vendor_source-00qnfx7in0i1551lypfpj48fxyrvvwn34j5fmwb1a7i9fhh4jd6w = substituteSource {
      src = fetchzip {
        name = "d29630953f3526b61842d937764f012503a79ec3-vendor_source-00qnfx7in0i1551lypfpj48fxyrvvwn34j5fmwb1a7i9fhh4jd6w-source";
        url = "https://github.com/luxonis/filesystem/archive/d29630953f3526b61842d937764f012503a79ec3.tar.gz";
        hash = "sha256-3DRJIHQpHhUWr65IMizfO/vuEJHXXU9DKSECG093FgM=";
      };
      substitutions = [
      ];
    };
    depthai-e4fd65105cdb7dada82c05670ea41fff244954d7 = substituteSource {
      src = fetchgit {
        name = "depthai-e4fd65105cdb7dada82c05670ea41fff244954d7-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "e4fd65105cdb7dada82c05670ea41fff244954d7";
        hash = "sha256-Z/nhOI5KHM7IdolX9uRSTJNKaqqzNAqU+ubBOBFkWKI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/9d9242b60d5236269f894efd3ddd60a9ca83dd7f.tar.gz\"";
          to = "URL ${_9d9242b60d5236269f894efd3ddd60a9ca83dd7f-vendor_source-043l7m5j47f7y6w84i173frv441jvqi0p5pa0hf9gjb539vxvpnd}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz\"";
          to = "URL ${v1-vendor_source-1b2h03iwfhcsg8i4f125mlrjf8l1y7qsr2gsbkv0z03i067lykns}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/catchorg/Catch2/archive/refs/tags/v3.4.0.tar.gz\"";
          to = "URL ${v3-vendor_source-1gdfsva6mnd66px85fmm3s65h8qzqnmgbmws2i3nygfav1y8d88f}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/cpp-pm/curl/archive/25d45e89d140d6ab27103cd7f8f6d7d6cf548d47.tar.gz\"";
          to = "URL ${_25d45e89d140d6ab27103cd7f8f6d7d6cf548d47-vendor_source-1prjrhgfpjy4j1kqbyrcp3yggw1rvna1na50g2yn1ibmf9582m5y}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz\"";
          to = "URL ${v1-vendor_source-03vmwbi9v7r3v8kzd0lj10fchp54kxbxwzfx7dp6qzkxjrvmx2dx}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/FP16/archive/c911175d2717e562976e606c6e5f799bf40cf94e.tar.gz\"";
          to = "URL ${c911175d2717e562976e606c6e5f799bf40cf94e-vendor_source-1lqqpdhy2szim2p0gpzz5ccazvsz85ab9anj54l7d355mad5ckp1}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/XLink/archive/2b517e1cb1ca77bea17679f9fdeb739812431174.tar.gz\"";
          to = "URL ${_2b517e1cb1ca77bea17679f9fdeb739812431174-vendor_source-0dbshg47lajzbmcl0zk9836ggw9126ix9607df3y2rg5js7595az}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/cpr/archive/50a1321738554e0152b0a6f1b0ca24e4fdecff5c.tar.gz\"";
          to = "URL ${_50a1321738554e0152b0a6f1b0ca24e4fdecff5c-vendor_source-00c821m4qdp1l2s5mabhbp44svphcss56gpisn53kr1y89a69wda}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/filesystem/archive/d29630953f3526b61842d937764f012503a79ec3.tar.gz\"";
          to = "URL ${d29630953f3526b61842d937764f012503a79ec3-vendor_source-00qnfx7in0i1551lypfpj48fxyrvvwn34j5fmwb1a7i9fhh4jd6w}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libarchive/archive/45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a.tar.gz\"";
          to = "URL ${_45baa3a3e57104519e1165bcd5ac29c3bd8c9f3a-vendor_source-0s7p17nc1b4z7hhir5y7sdq7j59ym9znmp6w8lq00vb2pnjc3978}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libnop/archive/ab842f51dc2eb13916dc98417c2186b78320ed10.tar.gz\"";
          to = "URL ${ab842f51dc2eb13916dc98417c2186b78320ed10-vendor_source-0l67zbmqqyf73bysdkpgfcslrc7m25lw936d8x9yx99x6aagyv3p}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/libusb/archive/b7e4548958325b18feb73977163ad44398099534.tar.gz\"";
          to = "URL ${b7e4548958325b18feb73977163ad44398099534-vendor_source-0hlrnrf962bqvaxfc0cm6fkp1fsgv8ww6lbanwbi4ychiaignd0f}";
        }
        {
          path = "cmake/Hunter/config.cmake";
          from = "URL \"https://github.com/luxonis/zlib/archive/refs/tags/v1.2.11-p2.tar.gz\"";
          to = "URL ${v1-vendor_source-19lfqpjsccfknnaf117kmr3xr73agl6hmnd8i7z3jvjnl8bijxh0}";
        }
      ];
    };
    googlemock-vendor_source-778dc88acb34184f7c1e9208dac338dd4cd2aaf8 = substituteSource {
      src = fetchgit {
        name = "googlemock-vendor_source-778dc88acb34184f7c1e9208dac338dd4cd2aaf8-source";
        url = "https://github.com/google/googlemock.git";
        rev = "778dc88acb34184f7c1e9208dac338dd4cd2aaf8";
        hash = "sha256-7KdgGz+dVi1AT/4pHt00wP2AtQJbZyjrYLhLMCsyb30=";
      };
      substitutions = [
      ];
    };
    googletest-vendor_source-6d1deeb565be215554ee28f0ec9c1ed0b12afa8e = substituteSource {
      src = fetchgit {
        name = "googletest-vendor_source-6d1deeb565be215554ee28f0ec9c1ed0b12afa8e-source";
        url = "https://github.com/google/googletest.git";
        rev = "6d1deeb565be215554ee28f0ec9c1ed0b12afa8e";
        hash = "sha256-w2JP5XDUPzyOtf6OY/UFkARa5X5w66W/IRnUAQ3Jg0s=";
      };
      substitutions = [
      ];
    };
    hunter-BZip2-1_0_6-p3-1v0zjx69r3fhjl4pvbjdk4lq9lyqkrf2frs1gjyqyd297psvblrz = substituteSource {
      src = fetchzip {
        name = "hunter-BZip2-1_0_6-p3-1v0zjx69r3fhjl4pvbjdk4lq9lyqkrf2frs1gjyqyd297psvblrz-source";
        url = "https://github.com/hunter-packages/bzip2/archive/v1.0.6-p3.tar.gz";
        hash = "sha256-P9O19T1JNI+9fEFnJ1ye2NOEKZlNrn0JldCNnEyXH+w=";
      };
      substitutions = [
      ];
    };
    hunter-BZip2-1_0_8-p0-0pxkhyhk2wi6i5yfqndhdzcby12hpx4hxcnr67ifvd9r17vvxgxx = substituteSource {
      src = fetchzip {
        name = "hunter-BZip2-1_0_8-p0-0pxkhyhk2wi6i5yfqndhdzcby12hpx4hxcnr67ifvd9r17vvxgxx-source";
        url = "https://github.com/cpp-pm/bzip2/archive/v1.0.8-p0.tar.gz";
        hash = "sha256-vb++9wk5te3iMdmyDkm/UAS/2G+wWex8iSZyMaGHs18=";
      };
      substitutions = [
      ];
    };
    hunter-CURL-7_49_1-DEV-v8-13nacvci92jlvmczmz1xknxpn0ybkkhivm8265ymvwgmgx5n09q3 = substituteSource {
      src = fetchzip {
        name = "hunter-CURL-7_49_1-DEV-v8-13nacvci92jlvmczmz1xknxpn0ybkkhivm8265ymvwgmgx5n09q3-source";
        url = "https://github.com/hunter-packages/curl/archive/hunter-7.49.1-v8.tar.gz";
        hash = "sha256-AydgS3/18V19MQLVHeGcywN7u509/PpZ3VSKFNlmyo4=";
      };
      substitutions = [
      ];
    };
    hunter-CURL-8_5_0-p0-1p3maiifchgvbgb0js8cfhnnb513ikafnc57xgkq8xb43frz73dp = substituteSource {
      src = fetchzip {
        name = "hunter-CURL-8_5_0-p0-1p3maiifchgvbgb0js8cfhnnb513ikafnc57xgkq8xb43frz73dp-source";
        url = "https://github.com/cpp-pm/curl/archive/refs/tags/v8.5.0-p0.tar.gz";
        hash = "sha256-t43zsxtkdYTn66cw69SMI5RlLXQMaQnWW/tB5mJUddw=";
      };
      substitutions = [
      ];
    };
    hunter-Expat-2_1_1-0zwr6g6hq8xdpjclabfh3nzf9m17i4p68x8a4lfhiamwpyclwwxl = substituteSource {
      src = fetchzip {
        name = "hunter-Expat-2_1_1-0zwr6g6hq8xdpjclabfh3nzf9m17i4p68x8a4lfhiamwpyclwwxl-source";
        url = "https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz";
        hash = "sha256-tHNOmb+8qggdJQp1ZC6JJ9Tkvh3QLUWZvK0jDM0zmX8=";
      };
      substitutions = [
      ];
    };
    hunter-Expat-2_2_9-p0-1y1993yav13i6cja4axjq6f5r6wfj9m9pixc0g98al5hr2x04hcm = substituteSource {
      src = fetchzip {
        name = "hunter-Expat-2_2_9-p0-1y1993yav13i6cja4axjq6f5r6wfj9m9pixc0g98al5hr2x04hcm-source";
        url = "https://github.com/cpp-pm/libexpat/archive/v2.2.9-p0.tar.gz";
        hash = "sha256-lUECusiwUIXSA6zHm2qSjptcnMGyK6IkM3GErfxIKfg=";
      };
      substitutions = [
      ];
    };
    hunter-FP16-0_0_0-febbb1c-p0-12jlgbhlwkhhhi17vpfiynzgfj7idzy5ialpmzdi1lswbggman80 = substituteSource {
      src = fetchzip {
        name = "hunter-FP16-0_0_0-febbb1c-p0-12jlgbhlwkhhhi17vpfiynzgfj7idzy5ialpmzdi1lswbggman80-source";
        url = "https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz";
        hash = "sha256-AFlV31tc0xDbr5eqWPxv8Uj3vvXR3X1ChBBOTuF6VIo=";
      };
      substitutions = [
        {
          path = "cmake/DownloadGoogleBenchmark.cmake";
          from = "URL https://github.com/google/benchmark/archive/v1.2.0.zip";
          to = "URL ${v1-vendor_source-1gld3zdxgc0c0466qvnsi70h2ksx8qprjrx008rypdhzp6660m48}";
        }
        {
          path = "cmake/DownloadPSimd.cmake";
          from = "GIT_REPOSITORY https://github.com/Maratyszcza/psimd.git";
          to = "URL ${psimd-vendor_source-072586a71b55b7f8c584153d223e95687148a900}";
        }
      ];
    };
    hunter-GTest-1_14_0-19c7f248rkg302yrbl5x7irfyi6a9whbpf45wn4bn9fk0625qi5p = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_14_0-19c7f248rkg302yrbl5x7irfyi6a9whbpf45wn4bn9fk0625qi5p-source";
        url = "https://github.com/google/googletest/archive/v1.14.0.tar.gz";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
      substitutions = [
      ];
    };
    hunter-GTest-1_7_0-hunter-6-0i9smmpr2rrsad9c4im61hiz19vq8l1l1y2h7hq5hx9waw0jk25k = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_7_0-hunter-6-0i9smmpr2rrsad9c4im61hiz19vq8l1l1y2h7hq5hx9waw0jk25k-source";
        url = "https://github.com/hunter-packages/gtest/archive/v1.7.0-hunter-6.tar.gz";
        hash = "sha256-s4gpAVc8dVgwPFD4QANFeKfwIwymRsJSUzpnkW+tOkU=";
      };
      substitutions = [
      ];
    };
    hunter-GTest-1_8_0-hunter-p7-10p77mxyq73av7hwnwdj75piqm0dyjaqm8sbxl9ka859cl1rfhnx = substituteSource {
      src = fetchzip {
        name = "hunter-GTest-1_8_0-hunter-p7-10p77mxyq73av7hwnwdj75piqm0dyjaqm8sbxl9ka859cl1rfhnx-source";
        url = "https://github.com/hunter-packages/googletest/archive/1.8.0-hunter-p7.tar.gz";
        hash = "sha256-3UKXA2WpIDUT7UujipX0DVQcbzmyccvh2Woc7Hs954I=";
      };
      substitutions = [
      ];
    };
    hunter-Libssh2-1_7_0-1c8nykf9qn0110scwiah56c1lrnmy685x38qbppb7cmbx2sqkym8 = substituteSource {
      src = fetchzip {
        name = "hunter-Libssh2-1_7_0-1c8nykf9qn0110scwiah56c1lrnmy685x38qbppb7cmbx2sqkym8-source";
        url = "https://github.com/hunter-packages/libssh2/archive/libssh2-1.7.0-hunter-4.tar.gz";
        hash = "sha256-qPqJteirsrPuXRiNXpDx1WYamClQRc40CAFYnNz0FrE=";
      };
      substitutions = [
      ];
    };
    hunter-Libssh2-1_9_0-p0-0w04yzxjybpl72j8jg3xyhhkcdadffsv4nnjy6mcm9ibfins87hc = substituteSource {
      src = fetchzip {
        name = "hunter-Libssh2-1_9_0-p0-0w04yzxjybpl72j8jg3xyhhkcdadffsv4nnjy6mcm9ibfins87hc-source";
        url = "https://github.com/cpp-pm/libssh2/archive/v1.9.0-p0.tar.gz";
        hash = "sha256-DB6kbXQrpsqq8dJasrVzTTU2IfR9PImkOPQuL/v3BHA=";
      };
      substitutions = [
      ];
    };
    hunter-OpenSSL-1_0_2l-1h0w6y4q3z62b6i9hsmv7mdqlfldc4k503cl3q1l9jqcimijnf19 = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-1_0_2l-1h0w6y4q3z62b6i9hsmv7mdqlfldc4k503cl3q1l9jqcimijnf19-source";
        url = "https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz";
        hash = "sha256-KTgrY40My0QDHpQNUCZhjTqKWz27apiiWcL8gYk3HMA=";
      };
      substitutions = [
      ];
    };
    hunter-OpenSSL-1_1_0f-1c6wdwr3vyfp0d9k81b4v2rj503qqv0qd92iwl0lz54xd7l0jk1q = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-1_1_0f-1c6wdwr3vyfp0d9k81b4v2rj503qqv0qd92iwl0lz54xd7l0jk1q-source";
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
    hunter-OpenSSL-3_0_12-1c23rgrhjqba4w1lc3awgfm88i176752aj492k2cn6wfz6yy1r2h = substituteSource {
      src = fetchzip {
        name = "hunter-OpenSSL-3_0_12-1c23rgrhjqba4w1lc3awgfm88i176752aj492k2cn6wfz6yy1r2h-source";
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
    hunter-ZLIB-1_2_8-p3-0c97k1vmhwdhd8g5z9h3n4v7k53mzn3vhvwd165mb07nxk9hc0rb = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_2_8-p3-0c97k1vmhwdhd8g5z9h3n4v7k53mzn3vhvwd165mb07nxk9hc0rb-source";
        url = "https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz";
        hash = "sha256-KwMG0+z2gFWLCY1vuIf9dZR5NrEDpl8earBxWHeYJzE=";
      };
      substitutions = [
      ];
    };
    hunter-ZLIB-1_3_0-p0-0664xa0fvzxaifnx6xzsspxygq27f8wzxsgzapwgjw8jbc8fskhg = substituteSource {
      src = fetchzip {
        name = "hunter-ZLIB-1_3_0-p0-0664xa0fvzxaifnx6xzsspxygq27f8wzxsgzapwgjw8jbc8fskhg-source";
        url = "https://github.com/cpp-pm/zlib/archive/refs/tags/v1.3.0-p0.tar.gz";
        hash = "sha256-D07tEFsScfn4Vf/p/jlyR+Dn+9X6d9Oti6r/7YDqxBg=";
      };
      substitutions = [
      ];
    };
    hunter-fmt-10_1_1-0l4viwqcmcn6g6kyxvdxvzp7dbjbpkcs79klrnkmscw78sabbpqz = substituteSource {
      src = fetchzip {
        name = "hunter-fmt-10_1_1-0l4viwqcmcn6g6kyxvdxvzp7dbjbpkcs79klrnkmscw78sabbpqz-source";
        url = "https://github.com/fmtlib/fmt/archive/10.1.1.tar.gz";
        hash = "sha256-H9+1lEaHM12nzXSmo9m8S6527t+97e6necayyjCPm1A=";
      };
      substitutions = [
      ];
    };
    hunter-fmt-4_0_0-0fzqfvwq98ir1mgmggm82xl673s1nbywn8mna50qjiqm71wqq09a = substituteSource {
      src = fetchzip {
        name = "hunter-fmt-4_0_0-0fzqfvwq98ir1mgmggm82xl673s1nbywn8mna50qjiqm71wqq09a-source";
        url = "https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz";
        hash = "sha256-KgGMeTgVR4lBUbYiy/2yQY9jaBeovldfDTmihPl2+Ds=";
      };
      substitutions = [
      ];
    };
    hunter-intsizeof-2_0_1-18i769yg7hfmgqspmrpyl3pqdbaskcjyjrimqz2x1hdx4cc49vwm = substituteSource {
      src = fetchzip {
        name = "hunter-intsizeof-2_0_1-18i769yg7hfmgqspmrpyl3pqdbaskcjyjrimqz2x1hdx4cc49vwm-source";
        url = "https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz";
        hash = "sha256-le9EGCO9wdDFxzVm6SWbWq2G76D+5no1ftXB83wyJ6I=";
      };
      substitutions = [
      ];
    };
    hunter-intsizeof-2_0_2-0xsbqmbxjwv91zgrcxsrss837kkf927zjk2vjamqr9ck8p03ndxa = substituteSource {
      src = fetchzip {
        name = "hunter-intsizeof-2_0_2-0xsbqmbxjwv91zgrcxsrss837kkf927zjk2vjamqr9ck8p03ndxa-source";
        url = "https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz";
        hash = "sha256-qjc7wEWTpYyrkltM+Y9Ibs4zkNZZd5bfD2lz2VfFS3c=";
      };
      substitutions = [
      ];
    };
    hunter-jsoncpp-0_7_0-0dh7l5bavk516rs4dzz4mrc7qb29hx7mkzbnnppvwbrvnbxf4py9 = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-0_7_0-0dh7l5bavk516rs4dzz4mrc7qb29hx7mkzbnnppvwbrvnbxf4py9-source";
        url = "https://github.com/open-source-parsers/jsoncpp/archive/0.7.0.tar.gz";
        hash = "sha256-yV/i+rI7L77vtXb9WU+HSSx8WK7k/0Z0NqHMrVahBzY=";
      };
      substitutions = [
      ];
    };
    hunter-jsoncpp-1_8_0-1lg22zrjnl10x1bw0wfz72xd2kfbzynyggk8vdwd89mp1g8xjl9d = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-1_8_0-1lg22zrjnl10x1bw0wfz72xd2kfbzynyggk8vdwd89mp1g8xjl9d-source";
        url = "https://github.com/open-source-parsers/jsoncpp/archive/1.8.0.tar.gz";
        hash = "sha256-LVHZ0Qu3JtR422i+563/y03RujjfccBX6CBQK/MX4tE=";
      };
      substitutions = [
      ];
    };
    hunter-jsoncpp-1_9_5-b1-0wscmrmqi90vl25fkpdd3a8qf7bid17wc4zq0hmjir5yypidcg2n = substituteSource {
      src = fetchzip {
        name = "hunter-jsoncpp-1_9_5-b1-0wscmrmqi90vl25fkpdd3a8qf7bid17wc4zq0hmjir5yypidcg2n-source";
        url = "https://github.com/julianoes/jsoncpp/archive/refs/tags/1.9.5-b1.tar.gz";
        hash = "sha256-VjzW4vW+5CgrBPgTxk9ocR2HkRqt3emKoBukiGuuTHM=";
      };
      substitutions = [
      ];
    };
    hunter-libxml2-2_9_7-p0-10yf4vnlpwmlq2fqk8gp13wr78sfrzqlpazjmjikd7x939lwnbyq = substituteSource {
      src = fetchzip {
        name = "hunter-libxml2-2_9_7-p0-10yf4vnlpwmlq2fqk8gp13wr78sfrzqlpazjmjikd7x939lwnbyq-source";
        url = "https://github.com/hunter-packages/libxml2/archive/v2.9.7-p0.tar.gz";
        hash = "sha256-2C/LaRqpnzajrPKrS/HPTqOT+Qj3oYmdwLTyS+0mzoM=";
      };
      substitutions = [
      ];
    };
    hunter-lz4-1_9_2-p0-1p3f13x6w084pf4ii147z55wrjqjhhm4gvl7wxcfsap29v5x2lcg = substituteSource {
      src = fetchzip {
        name = "hunter-lz4-1_9_2-p0-1p3f13x6w084pf4ii147z55wrjqjhhm4gvl7wxcfsap29v5x2lcg-source";
        url = "https://github.com/cpp-pm/lz4/archive/v1.9.2-p0.tar.gz";
        hash = "sha256-j1HRy07iKu1Y54fuRyqEEsvMS/mHhBiJuwQBbvoIbtw=";
      };
      substitutions = [
      ];
    };
    hunter-lzma-5_2_3-p4-02ns78cax94j2f82w3v8y4nb47znj3qfj36cmnykrraiqa0day0f = substituteSource {
      src = fetchzip {
        name = "hunter-lzma-5_2_3-p4-02ns78cax94j2f82w3v8y4nb47znj3qfj36cmnykrraiqa0day0f-source";
        url = "https://github.com/hunter-packages/lzma/archive/v5.2.3-p4.tar.gz";
        hash = "sha256-DnjVgMJR5Ty9rcwM6fCQ9h+yLPFoDy6QE5Kkrhg62go=";
      };
      substitutions = [
      ];
    };
    hunter-nlohmann_json-2_1_1-p1-1gnybpdk9wwzrlq7ys4a8zj0a0115aw6rg0k32frhkd5nzjis1pa = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-1gnybpdk9wwzrlq7ys4a8zj0a0115aw6rg0k32frhkd5nzjis1pa-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
      substitutions = [
      ];
    };
    hunter-nlohmann_json-3_11_2-0g6rfsbkvrxmacchz4kbr741yybj7mls3r4hgyfdd3pdbqhn2is9 = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_11_2-0g6rfsbkvrxmacchz4kbr741yybj7mls3r4hgyfdd3pdbqhn2is9-source";
        url = "https://github.com/nlohmann/json/archive/v3.11.2.tar.gz";
        hash = "sha256-SUdhIV7tjtacf5DkoWk9cnkfyMlrkg8ZU7XnPZd22Tw=";
      };
      substitutions = [
      ];
    };
    hunter-nlohmann_json-3_9_1-0ar4mzp53lskxw3vdzw07f47njcshl3lwid9jfq6l7yx6ds2nyjc = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_9_1-0ar4mzp53lskxw3vdzw07f47njcshl3lwid9jfq6l7yx6ds2nyjc-source";
        url = "https://github.com/nlohmann/json/archive/v3.9.1.tar.gz";
        hash = "sha256-THordDPdH2qwk6lFTgeFmkl7iDuA/7YH71PTUe6vJCs=";
      };
      substitutions = [
      ];
    };
    hunter-spdlog-0_13_0-p1-1ca0sa5y3fl9f7dmbm6gx0c2kbn02kpyfy74k6lwmn5xy35lbvhf = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-0_13_0-p1-1ca0sa5y3fl9f7dmbm6gx0c2kbn02kpyfy74k6lwmn5xy35lbvhf-source";
        url = "https://github.com/hunter-packages/spdlog/archive/v0.13.0-p1.tar.gz";
        hash = "sha256-Du5Fy/C92MqpmeR45+8UwK4pGOjP1FXbcYm64YvSQLE=";
      };
      substitutions = [
      ];
    };
    hunter-spdlog-1_0_0-p0-1ar2j7cvmf4bif1yhv31zx03kmx4cabg1dj6yfac8h97gin7h086 = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-1_0_0-p0-1ar2j7cvmf4bif1yhv31zx03kmx4cabg1dj6yfac8h97gin7h086-source";
        url = "https://github.com/hunter-packages/spdlog/archive/v1.0.0-p0.tar.gz";
        hash = "sha256-BgF4bHwnQcSU80a28JZipNc5QP9hbOiDi4u4utmRIqs=";
      };
      substitutions = [
      ];
    };
    hunter-spdlog-1_12_0-p0-1vsvfwpz6gsqzk2w4g3r93rvp8jadqrvivqqi38yjs9wvamlipnw = substituteSource {
      src = fetchzip {
        name = "hunter-spdlog-1_12_0-p0-1vsvfwpz6gsqzk2w4g3r93rvp8jadqrvivqqi38yjs9wvamlipnw-source";
        url = "https://github.com/cpp-pm/spdlog/archive/v1.12.0-p0.tar.gz";
        hash = "sha256-3N5Iq9o8aenRiBjvuDNuSqK780h5PMLF/Fg/8y93W+8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${benchmark-vendor_source-f91b6b42b1b9854772a90ae9501464a161707d1e}";
        }
      ];
    };
    hunter-zstd-1_5_5-0x3n97hx5x68fa7jz674rkabaaji1bijcqdm99rg5vhlqhicfwdl = substituteSource {
      src = fetchzip {
        name = "hunter-zstd-1_5_5-0x3n97hx5x68fa7jz674rkabaaji1bijcqdm99rg5vhlqhicfwdl-source";
        url = "https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
      substitutions = [
      ];
    };
    psimd-vendor_source-072586a71b55b7f8c584153d223e95687148a900 = substituteSource {
      src = fetchgit {
        name = "psimd-vendor_source-072586a71b55b7f8c584153d223e95687148a900-source";
        url = "https://github.com/Maratyszcza/psimd.git";
        rev = "072586a71b55b7f8c584153d223e95687148a900";
        hash = "sha256-lV+VZi2b4SQlRYrhKx9Dxc6HlDEFz3newvcBjTekupo=";
      };
      substitutions = [
      ];
    };
    v1-vendor_source-03vmwbi9v7r3v8kzd0lj10fchp54kxbxwzfx7dp6qzkxjrvmx2dx = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-03vmwbi9v7r3v8kzd0lj10fchp54kxbxwzfx7dp6qzkxjrvmx2dx-source";
        url = "https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
        hash = "sha256-vYled5Z9fmxuO9193lefpFzIHAiSgvYn2iOfneLidQ8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${benchmark-vendor_source-73d4d5e8d6d449fc8663765a42aa8aeeee844489}";
        }
      ];
    };
    v1-vendor_source-19lfqpjsccfknnaf117kmr3xr73agl6hmnd8i7z3jvjnl8bijxh0 = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-19lfqpjsccfknnaf117kmr3xr73agl6hmnd8i7z3jvjnl8bijxh0-source";
        url = "https://github.com/luxonis/zlib/archive/refs/tags/v1.2.11-p2.tar.gz";
        hash = "sha256-AHYZF6JWbjn+iajZCg19apzcR67zhOCUtdMxpuXFjqY=";
      };
      substitutions = [
      ];
    };
    v1-vendor_source-1b2h03iwfhcsg8i4f125mlrjf8l1y7qsr2gsbkv0z03i067lykns = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-1b2h03iwfhcsg8i4f125mlrjf8l1y7qsr2gsbkv0z03i067lykns-source";
        url = "https://github.com/bombela/backward-cpp/archive/refs/tags/v1.6.tar.gz";
        hash = "sha256-2k5PjwFxgA/2XPqJrPHxgSInM61FBEcieppBx+MAUKw=";
      };
      substitutions = [
      ];
    };
    v1-vendor_source-1gld3zdxgc0c0466qvnsi70h2ksx8qprjrx008rypdhzp6660m48 = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-1gld3zdxgc0c0466qvnsi70h2ksx8qprjrx008rypdhzp6660m48-source";
        url = "https://github.com/google/benchmark/archive/v1.2.0.zip";
        hash = "sha256-iFRgjLkftuszAqBnmS9GXU8BwYnabmwMAQyw19sfjb4=";
      };
      substitutions = [
      ];
    };
    v3-vendor_source-1gdfsva6mnd66px85fmm3s65h8qzqnmgbmws2i3nygfav1y8d88f = substituteSource {
      src = fetchzip {
        name = "v3-vendor_source-1gdfsva6mnd66px85fmm3s65h8qzqnmgbmws2i3nygfav1y8d88f-source";
        url = "https://github.com/catchorg/Catch2/archive/refs/tags/v3.4.0.tar.gz";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai";
  version = "2.28.0-1";
  src = sources.depthai-e4fd65105cdb7dada82c05670ea41fff244954d7;
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
