{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  sophus,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rko_lio";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."rko_lio";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rosbag2-cpp rosbag2-storage sensor-msgs sophus std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "nlohmann-json-dev" "tbb" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rclcpp-components rosbag2-cpp rosbag2-storage sensor-msgs sophus std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "tbb" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rko_lio" = substituteSource {
      src = fetchgit {
        name = "rko_lio-source";
        url = "https://github.com/ros2-gbp/rko_lio-release.git";
        rev = "1ee4f7397167e99174fc4109fe12538022fcd082";
        hash = "sha256-x294P8aW6yHSCayYPx+/UV2j7iu7pUMOffMvLwIvw88=";
      };
      substitutions = [
        {
          path = "cmake/dependencies/bonxai/bonxai.cmake";
          from = "GIT_REPOSITORY https://github.com/facontidavide/Bonxai.git";
          to = "URL ${sources."rko_lio/Bonxai"}";
        }
        {
          path = "cmake/dependencies/eigen/eigen.cmake";
          from = "URL https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz";
          to = "URL ${sources."rko_lio/eigen-3"}";
        }
        {
          path = "cmake/dependencies/json/nlohmann_json.cmake";
          from = "URL https://github.com/nlohmann/json/archive/refs/tags/v3.12.0.tar.gz";
          to = "URL ${sources."rko_lio/v3"}";
        }
        {
          path = "cmake/dependencies/sophus/sophus.cmake";
          from = "URL https://github.com/strasdat/Sophus/archive/refs/tags/1.24.6.tar.gz";
          to = "URL ${sources."rko_lio/1"}";
        }
        {
          path = "cmake/dependencies/tbb/tbb.cmake";
          from = "URL https://github.com/uxlfoundation/oneTBB/archive/refs/tags/v2022.2.0.tar.gz";
          to = "URL ${sources."rko_lio/v2022"}";
        }
      ];
    };
    "rko_lio/1" = substituteSource {
      src = fetchzip {
        name = "1-source";
        url = "https://github.com/strasdat/Sophus/archive/refs/tags/1.24.6.tar.gz";
        hash = "sha256-k5t3kSUrH6B1f60dtqq3Ai4R4D2h+Ld+6Cpljl/AN0w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11.git";
          to = "URL ${sources."rko_lio/1/pybind11"}";
        }
      ];
    };
    "rko_lio/1/pybind11" = substituteSource {
      src = fetchgit {
        name = "pybind11-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "3262000195616afedaf95185f1fe965c7eb82be6";
        hash = "sha256-rjcAeYE5Vq+FUOh4HOlYuLk2Ig/2F1Jft07wIVLipm4=";
      };
    };
    "rko_lio/Bonxai" = substituteSource {
      src = fetchgit {
        name = "Bonxai-source";
        url = "https://github.com/facontidavide/Bonxai.git";
        rev = "02d401b1ce38bce870c6704bcd4e35a56a641411";
        hash = "sha256-CFdbD6G1Dzh7uNbK9IRdEHAt9ZV5Nij38+/+Vm9yTj0=";
      };
    };
    "rko_lio/eigen-3" = substituteSource {
      src = fetchzip {
        name = "eigen-3-source";
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz";
        hash = "sha256-1/4xMetKMDOgZgzz3WMxfHUEpmdAm52RqZvz6i0mLEw=";
      };
    };
    "rko_lio/v2022" = substituteSource {
      src = fetchzip {
        name = "v2022-source";
        url = "https://github.com/uxlfoundation/oneTBB/archive/refs/tags/v2022.2.0.tar.gz";
        hash = "sha256-ASQPAGm5e4q7imvTVWlmj5ON4fGEao1L5m2C5wF7EhI=";
      };
    };
    "rko_lio/v3" = substituteSource {
      src = fetchzip {
        name = "v3-source";
        url = "https://github.com/nlohmann/json/archive/refs/tags/v3.12.0.tar.gz";
        hash = "sha256-cECvDOLxgX7Q9R3IE86Hj9JJUxraDQvhoyPDF03B2CY=";
      };
      substitutions = [
        {
          path = "docs/mkdocs/docs/integration/hunter/CMakeLists.txt";
          from = "URL \"https://github.com/cpp-pm/hunter/archive/v0.23.297.tar.gz\"";
          to = "URL ${sources."rko_lio/v3/v0"}";
        }
      ];
    };
    "rko_lio/v3/v0" = substituteSource {
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
          to = "URL ${sources."rko_lio/v3/v0/hunter-nlohmann_json-2_1_1-p1"}";
        }
        {
          path = "cmake/projects/nlohmann_json/hunter.cmake";
          from = "URL \"https://github.com/nlohmann/json/archive/v3.8.0.tar.gz\"";
          to = "URL ${sources."rko_lio/v3/v0/hunter-nlohmann_json-3_8_0"}";
        }
      ];
    };
    "rko_lio/v3/v0/hunter-nlohmann_json-2_1_1-p1" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-2_1_1-p1-source";
        url = "https://github.com/hunter-packages/json/archive/v2.1.1-p1.tar.gz";
        hash = "sha256-6gYd5belTZidGBO8bLgqIQAF5EeKaH8wzZ/zNNtd3r4=";
      };
    };
    "rko_lio/v3/v0/hunter-nlohmann_json-3_8_0" = substituteSource {
      src = fetchzip {
        name = "hunter-nlohmann_json-3_8_0-source";
        url = "https://github.com/nlohmann/json/archive/v3.8.0.tar.gz";
        hash = "sha256-x5+UfP8tXzDOTK4P9Ldn2L9XYzhCLDPP6sjZDI+bgiY=";
      };
    };
  });
  meta = {
    description = "A Robust Approach for LiDAR-Inertial Odometry Without Sensor-Specific Modelling";
  };
})
