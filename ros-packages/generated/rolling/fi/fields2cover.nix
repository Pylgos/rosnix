{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ortools-vendor,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "fields2cover";
  version = "2.0.0-17";
  src = finalAttrs.passthru.sources."fields2cover";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ortools-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "git" "gtest" "libgdal-dev" "libgeos++-dev" "python3" "python3-dev" "python3-matplotlib" "python3-tk" "swig" "tbb" "tinyxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ortools-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "git" "gtest" "libgdal-dev" "libgeos++-dev" "python3" "python3-dev" "python3-matplotlib" "python3-tk" "swig" "tbb" "tinyxml2" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" "lcov" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fields2cover" = substituteSource {
      src = fetchgit {
        name = "fields2cover-source";
        url = "https://github.com/ros2-gbp/fields2cover-release.git";
        rev = "6df954c05444487bd829e238b34bda6233357133";
        hash = "sha256-UNhHS/oiXXZTR8QMqaaMZYDOvQsjuMSV55C1WCPtsfE=";
      };
      substitutions = [
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/Fields2Cover/steering_functions.git";
          to = "URL ${sources."fields2cover/steering_functions"}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/alandefreitas/matplotplusplus.git";
          to = "URL ${sources."fields2cover/matplotplusplus"}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/google/or-tools.git";
          to = "URL ${sources."fields2cover/or-tools"}";
        }
        {
          path = "cmake/F2CUtils.cmake";
          from = "GIT_REPOSITORY https://github.com/nlohmann/json.git";
          to = "URL ${sources."fields2cover/json"}";
        }
      ];
    };
    "fields2cover/json" = substituteSource {
      src = fetchgit {
        name = "json-source";
        url = "https://github.com/nlohmann/json.git";
        rev = "4424a0fcc1c7fa640b5c87d26776d99150dacd10";
        hash = "sha256-eSqi4dhFrUvjYN+jD8nGqj1FbzGA6I2+eSqzdCGOLH8=";
      };
      substitutions = [
        {
          path = "docs/mkdocs/docs/integration/hunter/CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz\"";
          to = "URL ${sources."fields2cover/json/v0"}";
        }
      ];
    };
    "fields2cover/json/v0" = substituteSource {
      src = fetchzip {
        name = "v0-source";
        url = "https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz";
        hash = "sha256-Ybn/JTo2oysJMX73IYvxCMWruj0y73Gi+4UaYH+P+H0=";
      };
      substitutions = [
        {
          path = "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in";
          from = ". \"@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh\" && ";
          to = "";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz\"";
          to = "URL ${sources."fields2cover/json/v0/hunter-nlohmann_json-2_1_1-p1"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.8.0.tar.gz\"";
          to = "URL ${sources."fields2cover/json/v0/hunter-nlohmann_json-3_8_0"}";
        }
      ];
    };
    "fields2cover/json/v0/hunter-nlohmann_json-2_1_1-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
    };
    "fields2cover/json/v0/hunter-nlohmann_json-3_8_0" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_8_0-source";
        url = "https://github.com/nlohmann/json/archive/v3.8.0.tar.gz";
        hash = "sha256-x5+UfP8tXzDOTK4P9Ldn2L9XYzhCLDPP6sjZDI+bgiY=";
      };
    };
    "fields2cover/matplotplusplus" = substituteSource {
      src = fetchgit {
        name = "matplotplusplus-source";
        url = "https://github.com/alandefreitas/matplotplusplus.git";
        rev = "5d01eb3695b07634a2b6642fd423740dea9b026c";
        hash = "sha256-pJoWvmXyZZjZM6VHKV7mSBegbZH3dslaJFalTa3oQPY=";
      };
      substitutions = [
        {
          path = "source/matplot/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/glfw/glfw.git";
          to = "URL ${sources."fields2cover/matplotplusplus/glfw"}";
        }
      ];
    };
    "fields2cover/matplotplusplus/glfw" = substituteSource {
      src = fetchgit {
        name = "glfw-source";
        url = "https://github.com/glfw/glfw.git";
        rev = "7482de6071d21db77a7236155da44c172a7f6c9e";
        hash = "sha256-07MUBwvTgIFay211o+V5ScojEcUTm7FJYc5bcRXYJSA=";
      };
    };
    "fields2cover/or-tools" = substituteSource {
      src = fetchgit {
        name = "or-tools-source";
        url = "https://github.com/google/or-tools.git";
        rev = "3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94";
        hash = "sha256-Ip2mKl+MuzOPaF1a2FTubqT0tA4gzDnD8dR7dLaHHo8=";
      };
      substitutions = [
        {
          path = "cmake/cpp.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${sources."fields2cover/or-tools/doxygen-awesome-1"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/ERGO-Code/HiGHS.git\"";
          to = "URL ${sources."fields2cover/or-tools/HiGHS"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cbc.git\"";
          to = "URL ${sources."fields2cover/or-tools/Cbc"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cgl.git\"";
          to = "URL ${sources."fields2cover/or-tools/Cgl"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Clp.git\"";
          to = "URL ${sources."fields2cover/or-tools/Clp"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/CoinUtils.git\"";
          to = "URL ${sources."fields2cover/or-tools/CoinUtils"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/GLPK.git\"";
          to = "URL ${sources."fields2cover/or-tools/GLPK"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Osi.git\"";
          to = "URL ${sources."fields2cover/or-tools/Osi"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/abseil/abseil-cpp.git\"";
          to = "URL ${sources."fields2cover/or-tools/abseil-cpp"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/google/re2.git\"";
          to = "URL ${sources."fields2cover/or-tools/re2"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/madler/ZLIB.git\"";
          to = "URL ${sources."fields2cover/or-tools/ZLIB"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/protobuf.git\"";
          to = "URL ${sources."fields2cover/or-tools/protobuf"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/scipopt/scip.git\"";
          to = "URL ${sources."fields2cover/or-tools/scip"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://gitlab.com/libeigen/eigen.git\"";
          to = "URL ${sources."fields2cover/or-tools/eigen"}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/googletest.git";
          to = "URL ${sources."fields2cover/or-tools/googletest"}";
        }
        {
          path = "cmake/dotnet.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${sources."fields2cover/or-tools/doxygen-awesome-2"}";
        }
        {
          path = "cmake/java.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${sources."fields2cover/or-tools/doxygen-awesome-3"}";
        }
        {
          path = "cmake/python.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${sources."fields2cover/or-tools/doxygen-awesome-4"}";
        }
      ];
    };
    "fields2cover/or-tools/Cbc" = substituteSource {
      src = fetchgit {
        name = "Cbc-source";
        url = "https://github.com/Mizux/Cbc.git";
        rev = "b01a53da39577380acdb84d8a3577911c5d91a13";
        hash = "sha256-BZbcxscWO29o0haRtO4ND5EPm2v6k23t6bWnrtrG7AQ=";
      };
    };
    "fields2cover/or-tools/Cgl" = substituteSource {
      src = fetchgit {
        name = "Cgl-source";
        url = "https://github.com/Mizux/Cgl.git";
        rev = "59d95fba6605329d615d44ac7be0be2397210d5a";
        hash = "sha256-lSNsHs6BcGGMs5jnaYTqa+V6xzYshrB5U2AapkNxPR8=";
      };
    };
    "fields2cover/or-tools/Clp" = substituteSource {
      src = fetchgit {
        name = "Clp-source";
        url = "https://github.com/Mizux/Clp.git";
        rev = "914e0af16285ab6b0514947296213a0e67e80880";
        hash = "sha256-CpWM0t3CBPvuMbWq1fEsagP9kPFxI+VreeHjjH9cwkI=";
      };
    };
    "fields2cover/or-tools/CoinUtils" = substituteSource {
      src = fetchgit {
        name = "CoinUtils-source";
        url = "https://github.com/Mizux/CoinUtils.git";
        rev = "675cbb8e131f07705544a2e9074355cfa1a319b4";
        hash = "sha256-sR+ZM5mBAFss1NubW2jDg6oaCoPoRxn6YsSmk7xi2xI=";
      };
    };
    "fields2cover/or-tools/GLPK" = substituteSource {
      src = fetchgit {
        name = "GLPK-source";
        url = "https://github.com/Mizux/GLPK.git";
        rev = "2a3bad935570eb3339792b888a08e61a90db0be0";
        hash = "sha256-3sWQuyWpf62zyrGJwpWdsUBibIwdfiGeivdm3zEkjXk=";
      };
    };
    "fields2cover/or-tools/HiGHS" = substituteSource {
      src = fetchgit {
        name = "HiGHS-source";
        url = "https://github.com/ERGO-Code/HiGHS.git";
        rev = "21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232";
        hash = "sha256-Wa5ivUJk0t58FhZD0zy0zxHHj4/p8e9WcxXwu5zenxI=";
      };
    };
    "fields2cover/or-tools/Osi" = substituteSource {
      src = fetchgit {
        name = "Osi-source";
        url = "https://github.com/Mizux/Osi.git";
        rev = "d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a";
        hash = "sha256-/kwsR3bauIp2BNvTLqgoAivEZTLmIkcgUfzzcYB5Ytg=";
      };
    };
    "fields2cover/or-tools/ZLIB" = substituteSource {
      src = fetchgit {
        name = "ZLIB-source";
        url = "https://github.com/madler/ZLIB.git";
        rev = "04f42ceca40f73e2978b50e93806c2a18c1281fc";
        hash = "sha256-+Y5QRTo87r3xXslF01sbWd4RNMG1pFG/0LCthbCybsQ=";
      };
    };
    "fields2cover/or-tools/abseil-cpp" = substituteSource {
      src = fetchgit {
        name = "abseil-cpp-source";
        url = "https://github.com/abseil/abseil-cpp.git";
        rev = "2f9e432cce407ce0ae50676696666f33a77d42ac";
        hash = "sha256-D4E11bICKr3Z5RRah7QkfXVsXtuUg32FMmKpiOGjZDM=";
      };
    };
    "fields2cover/or-tools/doxygen-awesome-1" = substituteSource {
      src = fetchurl {
        name = "doxygen-awesome-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
    };
    "fields2cover/or-tools/doxygen-awesome-2" = substituteSource {
      src = fetchurl {
        name = "doxygen-awesome-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
    };
    "fields2cover/or-tools/doxygen-awesome-3" = substituteSource {
      src = fetchurl {
        name = "doxygen-awesome-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
    };
    "fields2cover/or-tools/doxygen-awesome-4" = substituteSource {
      src = fetchurl {
        name = "doxygen-awesome-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
    };
    "fields2cover/or-tools/eigen" = substituteSource {
      src = fetchgit {
        name = "eigen-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "3147391d946bb4b6c68edd901f2add6ac1f31f8c";
        hash = "sha256-1/4xMetKMDOgZgzz3WMxfHUEpmdAm52RqZvz6i0mLEw=";
      };
    };
    "fields2cover/or-tools/googletest" = substituteSource {
      src = fetchgit {
        name = "googletest-source";
        url = "https://github.com/google/googletest.git";
        rev = "f8d7d77c06936315286eb55f8de22cd23c188571";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
    };
    "fields2cover/or-tools/protobuf" = substituteSource {
      src = fetchgit {
        name = "protobuf-source";
        url = "https://github.com/protocolbuffers/protobuf.git";
        rev = "4a2aef570deb2bfb8927426558701e8bfc26f2a4";
        hash = "sha256-1gdHC+f1T3KOy8A7KlWOjauRHsMKfEXoQiYqZMzzMxI=";
      };
      substitutions = [
        {
          path = "upb/cmake/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/utf8_range.git\"";
          to = "URL ${sources."fields2cover/or-tools/protobuf/utf8_range"}";
        }
      ];
    };
    "fields2cover/or-tools/protobuf/utf8_range" = substituteSource {
      src = fetchgit {
        name = "utf8_range-source";
        url = "https://github.com/protocolbuffers/utf8_range.git";
        rev = "d863bc33e15cba6d873c878dcca9e6fe52b2f8cb";
        hash = "sha256-1iXa01BVX1wk7craFwC3liLnwT3487qvM93YIdOoEBs=";
      };
    };
    "fields2cover/or-tools/re2" = substituteSource {
      src = fetchgit {
        name = "re2-source";
        url = "https://github.com/google/re2.git";
        rev = "9665465b69ab699279ef9fb9454559d90fed1d76";
        hash = "sha256-a6yo0zLgb193TDL8akselJuZfYqCjPwQ/FJ7+KexuLE=";
      };
    };
    "fields2cover/or-tools/scip" = substituteSource {
      src = fetchgit {
        name = "scip-source";
        url = "https://github.com/scipopt/scip.git";
        rev = "61297938717271f462c995b99ab4b217ca1d9499";
        hash = "sha256-Ub0eykyZOlJtqUofTx4a2YcOMiyG6AUX0llxsqJ+YvE=";
      };
    };
    "fields2cover/steering_functions" = substituteSource {
      src = fetchgit {
        name = "steering_functions-source";
        url = "https://github.com/Fields2Cover/steering_functions.git";
        rev = "13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9";
        hash = "sha256-+gGBX6kKKI0G+0AVwvIRyuzFKlCgHp+woiV0jfu0REo=";
      };
    };
  });
  meta = {
    description = "\n    Robust and efficient coverage paths for autonomous agricultural vehicles.\n    A modular and extensible Coverage Path Planning library\n  ";
  };
})
