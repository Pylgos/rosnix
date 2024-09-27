{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ortools_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    Cbc-vendor_source-b01a53da39577380acdb84d8a3577911c5d91a13 = substituteSource {
      src = fetchgit {
        name = "Cbc-vendor_source-b01a53da39577380acdb84d8a3577911c5d91a13-source";
        url = "https://github.com/Mizux/Cbc.git";
        rev = "b01a53da39577380acdb84d8a3577911c5d91a13";
        hash = "sha256-BZbcxscWO29o0haRtO4ND5EPm2v6k23t6bWnrtrG7AQ=";
      };
      substitutions = [
      ];
    };
    Cgl-vendor_source-59d95fba6605329d615d44ac7be0be2397210d5a = substituteSource {
      src = fetchgit {
        name = "Cgl-vendor_source-59d95fba6605329d615d44ac7be0be2397210d5a-source";
        url = "https://github.com/Mizux/Cgl.git";
        rev = "59d95fba6605329d615d44ac7be0be2397210d5a";
        hash = "sha256-lSNsHs6BcGGMs5jnaYTqa+V6xzYshrB5U2AapkNxPR8=";
      };
      substitutions = [
      ];
    };
    Clp-vendor_source-914e0af16285ab6b0514947296213a0e67e80880 = substituteSource {
      src = fetchgit {
        name = "Clp-vendor_source-914e0af16285ab6b0514947296213a0e67e80880-source";
        url = "https://github.com/Mizux/Clp.git";
        rev = "914e0af16285ab6b0514947296213a0e67e80880";
        hash = "sha256-CpWM0t3CBPvuMbWq1fEsagP9kPFxI+VreeHjjH9cwkI=";
      };
      substitutions = [
      ];
    };
    CoinUtils-vendor_source-675cbb8e131f07705544a2e9074355cfa1a319b4 = substituteSource {
      src = fetchgit {
        name = "CoinUtils-vendor_source-675cbb8e131f07705544a2e9074355cfa1a319b4-source";
        url = "https://github.com/Mizux/CoinUtils.git";
        rev = "675cbb8e131f07705544a2e9074355cfa1a319b4";
        hash = "sha256-sR+ZM5mBAFss1NubW2jDg6oaCoPoRxn6YsSmk7xi2xI=";
      };
      substitutions = [
      ];
    };
    GLPK-vendor_source-2a3bad935570eb3339792b888a08e61a90db0be0 = substituteSource {
      src = fetchgit {
        name = "GLPK-vendor_source-2a3bad935570eb3339792b888a08e61a90db0be0-source";
        url = "https://github.com/Mizux/GLPK.git";
        rev = "2a3bad935570eb3339792b888a08e61a90db0be0";
        hash = "sha256-3sWQuyWpf62zyrGJwpWdsUBibIwdfiGeivdm3zEkjXk=";
      };
      substitutions = [
      ];
    };
    HiGHS-vendor_source-21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232 = substituteSource {
      src = fetchgit {
        name = "HiGHS-vendor_source-21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232-source";
        url = "https://github.com/ERGO-Code/HiGHS.git";
        rev = "21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232";
        hash = "sha256-Wa5ivUJk0t58FhZD0zy0zxHHj4/p8e9WcxXwu5zenxI=";
      };
      substitutions = [
      ];
    };
    Osi-vendor_source-d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a = substituteSource {
      src = fetchgit {
        name = "Osi-vendor_source-d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a-source";
        url = "https://github.com/Mizux/Osi.git";
        rev = "d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a";
        hash = "sha256-/kwsR3bauIp2BNvTLqgoAivEZTLmIkcgUfzzcYB5Ytg=";
      };
      substitutions = [
      ];
    };
    ZLIB-vendor_source-04f42ceca40f73e2978b50e93806c2a18c1281fc = substituteSource {
      src = fetchgit {
        name = "ZLIB-vendor_source-04f42ceca40f73e2978b50e93806c2a18c1281fc-source";
        url = "https://github.com/madler/ZLIB.git";
        rev = "04f42ceca40f73e2978b50e93806c2a18c1281fc";
        hash = "sha256-+Y5QRTo87r3xXslF01sbWd4RNMG1pFG/0LCthbCybsQ=";
      };
      substitutions = [
      ];
    };
    _20230802-vendor_source-05ngbfsvh20hr398261grj51igjv7a5bfz388ldk6l0i06qc10n8 = substituteSource {
      src = fetchzip {
        name = "_20230802-vendor_source-05ngbfsvh20hr398261grj51igjv7a5bfz388ldk6l0i06qc10n8-source";
        url = "https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
        hash = "sha256-yILAsAERUDMbRWh8t4o6W74YiswvGIHSyBAIuLVbzxY=";
      };
      substitutions = [
      ];
    };
    abseil_cpp-vendor_source-2f9e432cce407ce0ae50676696666f33a77d42ac = substituteSource {
      src = fetchgit {
        name = "abseil_cpp-vendor_source-2f9e432cce407ce0ae50676696666f33a77d42ac-source";
        url = "https://github.com/abseil/abseil-cpp.git";
        rev = "2f9e432cce407ce0ae50676696666f33a77d42ac";
        hash = "sha256-D4E11bICKr3Z5RRah7QkfXVsXtuUg32FMmKpiOGjZDM=";
      };
      substitutions = [
      ];
    };
    doxygen_awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w = substituteSource {
      src = fetchurl {
        name = "doxygen_awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    eigen-vendor_source-3147391d946bb4b6c68edd901f2add6ac1f31f8c = substituteSource {
      src = fetchgit {
        name = "eigen-vendor_source-3147391d946bb4b6c68edd901f2add6ac1f31f8c-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "3147391d946bb4b6c68edd901f2add6ac1f31f8c";
        hash = "sha256-1/4xMetKMDOgZgzz3WMxfHUEpmdAm52RqZvz6i0mLEw=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${lapack_addons_3-vendor_source-0g14qljdn9i6zqiplgx4l6nspxyv8qmsa6h435islaa7vjvyv6dx}";
        }
      ];
    };
    fields2cover-8cbb6e0b0e5d36e65182e2ed06497dd2ce9e97b2 = substituteSource {
      src = fetchgit {
        name = "fields2cover-8cbb6e0b0e5d36e65182e2ed06497dd2ce9e97b2-source";
        url = "https://github.com/ros2-gbp/fields2cover-release.git";
        rev = "8cbb6e0b0e5d36e65182e2ed06497dd2ce9e97b2";
        hash = "sha256-xKEiqC7A0ss07ipLYTzqWYAScu9nc3JycGuE1HocfSo=";
      };
      substitutions = [
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/Fields2Cover/steering_functions.git";
          to = "URL ${steering_functions-vendor_source-13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/google/or-tools.git";
          to = "URL ${or_tools-vendor_source-3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "URL https://github.com/google/or-tools/releases/download/v9.9/or-tools_amd64_ubuntu-22.04_cpp_v9.9.3963.tar.gz";
          to = "URL ${or_tools_amd64_ubuntu_22-vendor_source-1gm1zq8d1zjf2flcf28hvffxil35jm8wmdaipgplpg2vrlpqab9w}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "URL https://github.com/google/or-tools/releases/download/v9.9/or-tools_arm64_debian-11_cpp_v9.9.3963.tar.gz";
          to = "URL ${or_tools_arm64_debian_11_cpp_v9-vendor_source-12paklqms0gcdq9schnc6a0vcz3mcq2v6kcqiyasiyk9ry0j98fv}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz";
          to = "URL ${json-vendor_source-078fymbb5jzhg69bvwp1fr79rmcyy1nz7cjnwkisgkjpb24rywbj}";
        }
      ];
    };
    googletest-vendor_source-f8d7d77c06936315286eb55f8de22cd23c188571 = substituteSource {
      src = fetchgit {
        name = "googletest-vendor_source-f8d7d77c06936315286eb55f8de22cd23c188571-source";
        url = "https://github.com/google/googletest.git";
        rev = "f8d7d77c06936315286eb55f8de22cd23c188571";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
      substitutions = [
      ];
    };
    json-vendor_source-078fymbb5jzhg69bvwp1fr79rmcyy1nz7cjnwkisgkjpb24rywbj = substituteSource {
      src = fetchzip {
        name = "json-vendor_source-078fymbb5jzhg69bvwp1fr79rmcyy1nz7cjnwkisgkjpb24rywbj-source";
        url = "https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz";
        hash = "sha256-cnGfiVhXzqfj5Fay823wntWcTnbh8r2SefDLslb1Dh0=";
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
    or_tools-vendor_source-3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94 = substituteSource {
      src = fetchgit {
        name = "or_tools-vendor_source-3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94-source";
        url = "https://github.com/google/or-tools.git";
        rev = "3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94";
        hash = "sha256-Ip2mKl+MuzOPaF1a2FTubqT0tA4gzDnD8dR7dLaHHo8=";
      };
      substitutions = [
        {
          path = "cmake/cpp.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${doxygen_awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/ERGO-Code/HiGHS.git\"";
          to = "URL ${HiGHS-vendor_source-21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cbc.git\"";
          to = "URL ${Cbc-vendor_source-b01a53da39577380acdb84d8a3577911c5d91a13}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cgl.git\"";
          to = "URL ${Cgl-vendor_source-59d95fba6605329d615d44ac7be0be2397210d5a}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Clp.git\"";
          to = "URL ${Clp-vendor_source-914e0af16285ab6b0514947296213a0e67e80880}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/CoinUtils.git\"";
          to = "URL ${CoinUtils-vendor_source-675cbb8e131f07705544a2e9074355cfa1a319b4}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/GLPK.git\"";
          to = "URL ${GLPK-vendor_source-2a3bad935570eb3339792b888a08e61a90db0be0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Osi.git\"";
          to = "URL ${Osi-vendor_source-d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/abseil/abseil-cpp.git\"";
          to = "URL ${abseil_cpp-vendor_source-2f9e432cce407ce0ae50676696666f33a77d42ac}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/google/re2.git\"";
          to = "URL ${re2-vendor_source-9665465b69ab699279ef9fb9454559d90fed1d76}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/madler/ZLIB.git\"";
          to = "URL ${ZLIB-vendor_source-04f42ceca40f73e2978b50e93806c2a18c1281fc}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/protobuf.git\"";
          to = "URL ${protobuf-vendor_source-4a2aef570deb2bfb8927426558701e8bfc26f2a4}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${pybind11-vendor_source-8a099e44b3d5f85b20f05828d919d2332a8de841}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_abseil.git\"";
          to = "URL ${pybind11_abseil-vendor_source-52f27398876a3177049977249e004770bd869e61}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_protobuf.git\"";
          to = "URL ${pybind11_protobuf-vendor_source-3b11990a99dea5101799e61d98a82c4737d240cc}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/scipopt/scip.git\"";
          to = "URL ${scip-vendor_source-61297938717271f462c995b99ab4b217ca1d9499}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://gitlab.com/libeigen/eigen.git\"";
          to = "URL ${eigen-vendor_source-3147391d946bb4b6c68edd901f2add6ac1f31f8c}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/googletest.git";
          to = "URL ${googletest-vendor_source-f8d7d77c06936315286eb55f8de22cd23c188571}";
        }
        {
          path = "cmake/dotnet.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${doxygen_awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w}";
        }
        {
          path = "cmake/java.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${doxygen_awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w}";
        }
        {
          path = "cmake/python.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${doxygen_awesome-vendor_source-0w2qwp8silywwxp83c93j50bm4cxzn7i3zxxiwyqgy2i73v5528w}";
        }
      ];
    };
    or_tools_amd64_ubuntu_22-vendor_source-1gm1zq8d1zjf2flcf28hvffxil35jm8wmdaipgplpg2vrlpqab9w = substituteSource {
      src = fetchzip {
        name = "or_tools_amd64_ubuntu_22-vendor_source-1gm1zq8d1zjf2flcf28hvffxil35jm8wmdaipgplpg2vrlpqab9w-source";
        url = "https://github.com/google/or-tools/releases/download/v9.9/or-tools_amd64_ubuntu-22.04_cpp_v9.9.3963.tar.gz";
        hash = "sha256-PC2FL81bvEvvu1G1ylGVZdDYndsQCceoE07+0BD+ob4=";
      };
      substitutions = [
      ];
    };
    or_tools_arm64_debian_11_cpp_v9-vendor_source-12paklqms0gcdq9schnc6a0vcz3mcq2v6kcqiyasiyk9ry0j98fv = substituteSource {
      src = fetchzip {
        name = "or_tools_arm64_debian_11_cpp_v9-vendor_source-12paklqms0gcdq9schnc6a0vcz3mcq2v6kcqiyasiyk9ry0j98fv-source";
        url = "https://github.com/google/or-tools/releases/download/v9.9/or-tools_arm64_debian-11_cpp_v9.9.3963.tar.gz";
        hash = "sha256-26Ekgc9p+qiVj5hNswVmdXy2gTLMQqYTbuwBXTGd6oo=";
      };
      substitutions = [
      ];
    };
    protobuf-vendor_source-4a2aef570deb2bfb8927426558701e8bfc26f2a4 = substituteSource {
      src = fetchgit {
        name = "protobuf-vendor_source-4a2aef570deb2bfb8927426558701e8bfc26f2a4-source";
        url = "https://github.com/protocolbuffers/protobuf.git";
        rev = "4a2aef570deb2bfb8927426558701e8bfc26f2a4";
        hash = "sha256-1gdHC+f1T3KOy8A7KlWOjauRHsMKfEXoQiYqZMzzMxI=";
      };
      substitutions = [
        {
          path = "upb/cmake/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/utf8_range.git\"";
          to = "URL ${utf8_range-vendor_source-d863bc33e15cba6d873c878dcca9e6fe52b2f8cb}";
        }
      ];
    };
    pybind11-vendor_source-8a099e44b3d5f85b20f05828d919d2332a8de841 = substituteSource {
      src = fetchgit {
        name = "pybind11-vendor_source-8a099e44b3d5f85b20f05828d919d2332a8de841-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
    pybind11_abseil-vendor_source-52f27398876a3177049977249e004770bd869e61 = substituteSource {
      src = fetchgit {
        name = "pybind11_abseil-vendor_source-52f27398876a3177049977249e004770bd869e61-source";
        url = "https://github.com/pybind/pybind11_abseil.git";
        rev = "52f27398876a3177049977249e004770bd869e61";
        hash = "sha256-I63AVof0Zfm4B0WTS4W35HCGN9MuAR2MAriEFVsvPrA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
          to = "URL ${_20230802-vendor_source-05ngbfsvh20hr398261grj51igjv7a5bfz388ldk6l0i06qc10n8}";
        }
      ];
    };
    pybind11_protobuf-vendor_source-3b11990a99dea5101799e61d98a82c4737d240cc = substituteSource {
      src = fetchgit {
        name = "pybind11_protobuf-vendor_source-3b11990a99dea5101799e61d98a82c4737d240cc-source";
        url = "https://github.com/pybind/pybind11_protobuf.git";
        rev = "3b11990a99dea5101799e61d98a82c4737d240cc";
        hash = "sha256-saeBxffAbDoHI/YvLatSubpdch9vb5DAfp/Bz3MC8ps=";
      };
      substitutions = [
      ];
    };
    re2-vendor_source-9665465b69ab699279ef9fb9454559d90fed1d76 = substituteSource {
      src = fetchgit {
        name = "re2-vendor_source-9665465b69ab699279ef9fb9454559d90fed1d76-source";
        url = "https://github.com/google/re2.git";
        rev = "9665465b69ab699279ef9fb9454559d90fed1d76";
        hash = "sha256-a6yo0zLgb193TDL8akselJuZfYqCjPwQ/FJ7+KexuLE=";
      };
      substitutions = [
      ];
    };
    scip-vendor_source-61297938717271f462c995b99ab4b217ca1d9499 = substituteSource {
      src = fetchgit {
        name = "scip-vendor_source-61297938717271f462c995b99ab4b217ca1d9499-source";
        url = "https://github.com/scipopt/scip.git";
        rev = "61297938717271f462c995b99ab4b217ca1d9499";
        hash = "sha256-Ub0eykyZOlJtqUofTx4a2YcOMiyG6AUX0llxsqJ+YvE=";
      };
      substitutions = [
      ];
    };
    steering_functions-vendor_source-13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9 = substituteSource {
      src = fetchgit {
        name = "steering_functions-vendor_source-13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9-source";
        url = "https://github.com/Fields2Cover/steering_functions.git";
        rev = "13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9";
        hash = "sha256-+gGBX6kKKI0G+0AVwvIRyuzFKlCgHp+woiV0jfu0REo=";
      };
      substitutions = [
      ];
    };
    utf8_range-vendor_source-d863bc33e15cba6d873c878dcca9e6fe52b2f8cb = substituteSource {
      src = fetchgit {
        name = "utf8_range-vendor_source-d863bc33e15cba6d873c878dcca9e6fe52b2f8cb-source";
        url = "https://github.com/protocolbuffers/utf8_range.git";
        rev = "d863bc33e15cba6d873c878dcca9e6fe52b2f8cb";
        hash = "sha256-1iXa01BVX1wk7craFwC3liLnwT3487qvM93YIdOoEBs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fields2cover";
  version = "2.0.0-10";
  src = sources.fields2cover-8cbb6e0b0e5d36e65182e2ed06497dd2ce9e97b2;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" "python3-dev" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ortools_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "gtest" "libgdal-dev" "libgeos++-dev" "python3" "python3-matplotlib" "python3-tk" "swig" "tbb" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" "lcov" ]; };
  meta = {
    description = "Robust and efficient coverage paths for autonomous agricultural vehicles. A modular and extensible Coverage Path Planning library";
  };
}
