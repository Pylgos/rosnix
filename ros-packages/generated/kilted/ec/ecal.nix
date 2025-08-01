{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ecal";
  version = "5.12.0-5";
  src = finalAttrs.passthru.sources."ecal";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "protobuf-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "protobuf-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ecal" = substituteSource {
      src = fetchgit {
        name = "ecal-source";
        url = "https://github.com/ros2-gbp/ecal-release.git";
        rev = "3730c86b7e30ad518932206497e4d0569378c2d3";
        hash = "sha256-ZOlO0rpToQHuRmI28wRBT5swBjy5JZgSsXLxM5bawlQ=";
      };
      substitutions = [
        {
          path = "thirdparty/ftxui/cmake/ftxui_find_google_benchmark.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/benchmark\"";
          to = "URL ${sources."ecal/benchmark-1"}";
        }
        {
          path = "thirdparty/spdlog/bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${sources."ecal/benchmark-2"}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/asio/asio_make_available.cmake";
          from = "GIT_REPOSITORY https://github.com/chriskohlhoff/asio.git";
          to = "URL ${sources."ecal/asio"}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/npcap/npcap_make_available.cmake";
          from = "URL      \"\${NPCAP_SDK_ARCHIVE_URL}\"";
          to = "URL ${sources."ecal/npcap-sdk-1"}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/pcapplusplus/pcapplusplus_make_available.cmake";
          from = "URL      \"\${PCAPPLUSPLUS_ARCHIVE_URL}\"";
          to = "URL ${sources."ecal/pcapplusplus-22"}";
        }
      ];
    };
    "ecal/asio" = substituteSource {
      src = fetchgit {
        name = "asio-source";
        url = "https://github.com/chriskohlhoff/asio.git";
        rev = "147f7225a96d45a2807a64e443177f621844e51c";
        hash = "sha256-z68qIh0+VTUEjVrv+Jvq2dDzxPHqq1ZRutjuiJ27w+A=";
      };
    };
    "ecal/benchmark-1" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark";
        rev = "62937f91b5c763a8e119d0c20c67b87bde8eff1c";
        hash = "sha256-oFp/TbBpEB993RAcIZUV8ZIqaXKTuvupqDrp76nbaug=";
      };
    };
    "ecal/benchmark-2" = substituteSource {
      src = fetchgit {
        name = "benchmark-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
    };
    "ecal/npcap-sdk-1" = substituteSource {
      src = fetchzip {
        name = "npcap-sdk-1-source";
        url = "https://npcap.com/dist/npcap-sdk-1.13.zip";
        hash = "sha256-JROhJKweBWqwzleACr/driU8eLiOosUD2uZ8Nq2wJyg=";
      };
    };
    "ecal/pcapplusplus-22" = substituteSource {
      src = fetchzip {
        name = "pcapplusplus-22-source";
        url = "https://github.com/seladb/PcapPlusPlus/releases/download/v22.05/pcapplusplus-22.05-windows-vs2015.zip";
        hash = "sha256-8HiKbhapQYlTdM5kDFT2D4KkKg9upviZDRf/VK4pXKM=";
      };
    };
  });
  meta = {
    description = "eCAL - enhanced Communication Abstraction Layer. A fast publish-subscribe cross-plattform middleware using Shared Memory and UDP.";
  };
})
