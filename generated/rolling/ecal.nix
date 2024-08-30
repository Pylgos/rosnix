{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  protobuf,
  substituteSource,
}:
let
  sources = rec {
    ecal = substituteSource {
      src = fetchgit {
        name = "ecal-source";
        url = "https://github.com/ros2-gbp/ecal-release.git";
        rev = "057eaff3ce9ce0c1428019675ffb7332c96ec0b5";
        hash = "sha256-ZOlO0rpToQHuRmI28wRBT5swBjy5JZgSsXLxM5bawlQ=";
      };
      substitutions = [
        {
          path = "thirdparty/ftxui/cmake/ftxui_find_google_benchmark.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/benchmark\"";
          to = "URL ${ecal-vendor_source-benchmark-1}";
        }
        {
          path = "thirdparty/spdlog/bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/asio/asio_make_available.cmake";
          from = "GIT_REPOSITORY https://github.com/chriskohlhoff/asio.git";
          to = "URL ${ecal-vendor_source-asio-3}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/npcap/npcap_make_available.cmake";
          from = "URL      \"\${NPCAP_SDK_ARCHIVE_URL}\"";
          to = "URL ${ecal-vendor_source-npcap-sdk-1-2}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/pcapplusplus/pcapplusplus_make_available.cmake";
          from = "URL      \"\${PCAPPLUSPLUS_ARCHIVE_URL}\"";
          to = "URL ${ecal-vendor_source-pcapplusplus-22-4}";
        }
      ];
    };
    ecal-vendor_source-asio-3 = substituteSource {
      src = fetchgit {
        name = "ecal-vendor_source-asio-3-source";
        url = "https://github.com/chriskohlhoff/asio.git";
        rev = "147f7225a96d45a2807a64e443177f621844e51c";
        hash = "sha256-z68qIh0+VTUEjVrv+Jvq2dDzxPHqq1ZRutjuiJ27w+A=";
      };
      substitutions = [
      ];
    };
    ecal-vendor_source-benchmark-1 = substituteSource {
      src = fetchgit {
        name = "ecal-vendor_source-benchmark-1-source";
        url = "https://github.com/google/benchmark";
        rev = "62937f91b5c763a8e119d0c20c67b87bde8eff1c";
        hash = "sha256-oFp/TbBpEB993RAcIZUV8ZIqaXKTuvupqDrp76nbaug=";
      };
      substitutions = [
      ];
    };
    ecal-vendor_source-npcap-sdk-1-2 = substituteSource {
      src = fetchzip {
        name = "ecal-vendor_source-npcap-sdk-1-2-source";
        url = "https://npcap.com/dist/npcap-sdk-1.13.zip";
        hash = "sha256-JROhJKweBWqwzleACr/driU8eLiOosUD2uZ8Nq2wJyg=";
      };
      substitutions = [
      ];
    };
    ecal-vendor_source-pcapplusplus-22-4 = substituteSource {
      src = fetchzip {
        name = "ecal-vendor_source-pcapplusplus-22-4-source";
        url = "https://github.com/seladb/PcapPlusPlus/releases/download/v22.05/pcapplusplus-22.05-windows-vs2015.zip";
        hash = "sha256-8HiKbhapQYlTdM5kDFT2D4KkKg9upviZDRf/VK4pXKM=";
      };
      substitutions = [
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
  };
in
buildRosPackage {
  pname = "ecal";
  version = "5.12.0-4";
  src = sources.ecal;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ protobuf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "eCAL - enhanced Communication Abstraction Layer. A fast publish-subscribe cross-plattform middleware using Shared Memory and UDP.";
  };
}
