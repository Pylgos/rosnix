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
    fields2cover = substituteSource {
      src = fetchgit {
        name = "fields2cover-source";
        url = "https://github.com/ros2-gbp/fields2cover-release.git";
        rev = "235d95ed37cb3dde6973b4972669c72c4eca6d8c";
        hash = "sha256-xKEiqC7A0ss07ipLYTzqWYAScu9nc3JycGuE1HocfSo=";
      };
      substitutions = [
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/Fields2Cover/steering_functions.git";
          to = "URL ${fields2cover-vendor_source-steering_functions-22}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/google/or-tools.git";
          to = "URL ${fields2cover-vendor_source-or-tools-0}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "URL https://github.com/google/or-tools/releases/download/v9.9/or-tools_amd64_ubuntu-22.04_cpp_v9.9.3963.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools_amd64_ubuntu-22-20}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "URL https://github.com/google/or-tools/releases/download/v9.9/or-tools_arm64_debian-11_cpp_v9.9.3963.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools_arm64_debian-11_cpp_v9-21}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz";
          to = "URL ${fields2cover-vendor_source-json-23}";
        }
      ];
    };
    fields2cover-vendor_source-json-23 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-json-23-source";
        url = "https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz";
        hash = "sha256-cnGfiVhXzqfj5Fay823wntWcTnbh8r2SefDLslb1Dh0=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-source";
        url = "https://github.com/google/or-tools.git";
        rev = "3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94";
        hash = "sha256-Ip2mKl+MuzOPaF1a2FTubqT0tA4gzDnD8dR7dLaHHo8=";
      };
      substitutions = [
        {
          path = "cmake/cpp.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-19}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/ERGO-Code/HiGHS.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-HiGHS-11}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cbc.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-Cbc-17}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cgl.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-Cgl-16}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Clp.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-Clp-15}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/CoinUtils.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-CoinUtils-13}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/GLPK.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-GLPK-10}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Osi.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-Osi-14}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/abseil/abseil-cpp.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-abseil-cpp-1}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/google/re2.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-re2-4}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/madler/ZLIB.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-ZLIB-0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/protobuf.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-protobuf-2}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-6}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_abseil.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_abseil-7}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_protobuf.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_protobuf-9}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/scipopt/scip.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-scip-12}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://gitlab.com/libeigen/eigen.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-eigen-5}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/googletest.git";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-googletest-18}";
        }
        {
          path = "cmake/dotnet.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-19}";
        }
        {
          path = "cmake/java.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-19}";
        }
        {
          path = "cmake/python.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-19}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-Cbc-17 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-Cbc-17-source";
        url = "https://github.com/Mizux/Cbc.git";
        rev = "b01a53da39577380acdb84d8a3577911c5d91a13";
        hash = "sha256-BZbcxscWO29o0haRtO4ND5EPm2v6k23t6bWnrtrG7AQ=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-Cgl-16 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-Cgl-16-source";
        url = "https://github.com/Mizux/Cgl.git";
        rev = "59d95fba6605329d615d44ac7be0be2397210d5a";
        hash = "sha256-lSNsHs6BcGGMs5jnaYTqa+V6xzYshrB5U2AapkNxPR8=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-Clp-15 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-Clp-15-source";
        url = "https://github.com/Mizux/Clp.git";
        rev = "914e0af16285ab6b0514947296213a0e67e80880";
        hash = "sha256-CpWM0t3CBPvuMbWq1fEsagP9kPFxI+VreeHjjH9cwkI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-CoinUtils-13 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-CoinUtils-13-source";
        url = "https://github.com/Mizux/CoinUtils.git";
        rev = "675cbb8e131f07705544a2e9074355cfa1a319b4";
        hash = "sha256-sR+ZM5mBAFss1NubW2jDg6oaCoPoRxn6YsSmk7xi2xI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-GLPK-10 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-GLPK-10-source";
        url = "https://github.com/Mizux/GLPK.git";
        rev = "2a3bad935570eb3339792b888a08e61a90db0be0";
        hash = "sha256-3sWQuyWpf62zyrGJwpWdsUBibIwdfiGeivdm3zEkjXk=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-HiGHS-11 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-HiGHS-11-source";
        url = "https://github.com/ERGO-Code/HiGHS.git";
        rev = "21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232";
        hash = "sha256-Wa5ivUJk0t58FhZD0zy0zxHHj4/p8e9WcxXwu5zenxI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-Osi-14 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-Osi-14-source";
        url = "https://github.com/Mizux/Osi.git";
        rev = "d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a";
        hash = "sha256-/kwsR3bauIp2BNvTLqgoAivEZTLmIkcgUfzzcYB5Ytg=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-ZLIB-0 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-ZLIB-0-source";
        url = "https://github.com/madler/ZLIB.git";
        rev = "04f42ceca40f73e2978b50e93806c2a18c1281fc";
        hash = "sha256-+Y5QRTo87r3xXslF01sbWd4RNMG1pFG/0LCthbCybsQ=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-abseil-cpp-1 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-abseil-cpp-1-source";
        url = "https://github.com/abseil/abseil-cpp.git";
        rev = "2f9e432cce407ce0ae50676696666f33a77d42ac";
        hash = "sha256-D4E11bICKr3Z5RRah7QkfXVsXtuUg32FMmKpiOGjZDM=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-19 = substituteSource {
      src = fetchurl {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-doxygen-awesome-19-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-eigen-5 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-eigen-5-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "3147391d946bb4b6c68edd901f2add6ac1f31f8c";
        hash = "sha256-1/4xMetKMDOgZgzz3WMxfHUEpmdAm52RqZvz6i0mLEw=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${gtsam-vendor_source-lapack_addons_3-0}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-googletest-18 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-googletest-18-source";
        url = "https://github.com/google/googletest.git";
        rev = "f8d7d77c06936315286eb55f8de22cd23c188571";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-protobuf-2 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-protobuf-2-source";
        url = "https://github.com/protocolbuffers/protobuf.git";
        rev = "4a2aef570deb2bfb8927426558701e8bfc26f2a4";
        hash = "sha256-1gdHC+f1T3KOy8A7KlWOjauRHsMKfEXoQiYqZMzzMxI=";
      };
      substitutions = [
        {
          path = "upb/cmake/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/utf8_range.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-protobuf-2-vendor_source-utf8_range-2}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-protobuf-2-vendor_source-utf8_range-2 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-protobuf-2-vendor_source-utf8_range-2-source";
        url = "https://github.com/protocolbuffers/utf8_range.git";
        rev = "d863bc33e15cba6d873c878dcca9e6fe52b2f8cb";
        hash = "sha256-1iXa01BVX1wk7craFwC3liLnwT3487qvM93YIdOoEBs=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-6 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-pybind11-6-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_abseil-7 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_abseil-7-source";
        url = "https://github.com/pybind/pybind11_abseil.git";
        rev = "52f27398876a3177049977249e004770bd869e61";
        hash = "sha256-I63AVof0Zfm4B0WTS4W35HCGN9MuAR2MAriEFVsvPrA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_abseil-7-vendor_source-20230802-7}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_abseil-7-vendor_source-20230802-7 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_abseil-7-vendor_source-20230802-7-source";
        url = "https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
        hash = "sha256-yILAsAERUDMbRWh8t4o6W74YiswvGIHSyBAIuLVbzxY=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_protobuf-9 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-pybind11_protobuf-9-source";
        url = "https://github.com/pybind/pybind11_protobuf.git";
        rev = "3b11990a99dea5101799e61d98a82c4737d240cc";
        hash = "sha256-saeBxffAbDoHI/YvLatSubpdch9vb5DAfp/Bz3MC8ps=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-re2-4 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-re2-4-source";
        url = "https://github.com/google/re2.git";
        rev = "9665465b69ab699279ef9fb9454559d90fed1d76";
        hash = "sha256-a6yo0zLgb193TDL8akselJuZfYqCjPwQ/FJ7+KexuLE=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-0-vendor_source-scip-12 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-0-vendor_source-scip-12-source";
        url = "https://github.com/scipopt/scip.git";
        rev = "61297938717271f462c995b99ab4b217ca1d9499";
        hash = "sha256-Ub0eykyZOlJtqUofTx4a2YcOMiyG6AUX0llxsqJ+YvE=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools_amd64_ubuntu-22-20 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools_amd64_ubuntu-22-20-source";
        url = "https://github.com/google/or-tools/releases/download/v9.9/or-tools_amd64_ubuntu-22.04_cpp_v9.9.3963.tar.gz";
        hash = "sha256-PC2FL81bvEvvu1G1ylGVZdDYndsQCceoE07+0BD+ob4=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools_arm64_debian-11_cpp_v9-21 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools_arm64_debian-11_cpp_v9-21-source";
        url = "https://github.com/google/or-tools/releases/download/v9.9/or-tools_arm64_debian-11_cpp_v9.9.3963.tar.gz";
        hash = "sha256-26Ekgc9p+qiVj5hNswVmdXy2gTLMQqYTbuwBXTGd6oo=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-steering_functions-22 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-steering_functions-22-source";
        url = "https://github.com/Fields2Cover/steering_functions.git";
        rev = "13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9";
        hash = "sha256-+gGBX6kKKI0G+0AVwvIRyuzFKlCgHp+woiV0jfu0REo=";
      };
      substitutions = [
      ];
    };
    gtsam-vendor_source-lapack_addons_3-0 = substituteSource {
      src = fetchurl {
        name = "gtsam-vendor_source-lapack_addons_3-0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fields2cover";
  version = "2.0.0-15";
  src = sources.fields2cover;
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
