{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    asio-vendor_source-147f7225a96d45a2807a64e443177f621844e51c = substituteSource {
      src = fetchgit {
        name = "asio-vendor_source-147f7225a96d45a2807a64e443177f621844e51c-source";
        url = "https://github.com/chriskohlhoff/asio.git";
        rev = "147f7225a96d45a2807a64e443177f621844e51c";
        hash = "sha256-z68qIh0+VTUEjVrv+Jvq2dDzxPHqq1ZRutjuiJ27w+A=";
      };
      substitutions = [
      ];
    };
    benchmark-vendor_source-62937f91b5c763a8e119d0c20c67b87bde8eff1c = substituteSource {
      src = fetchgit {
        name = "benchmark-vendor_source-62937f91b5c763a8e119d0c20c67b87bde8eff1c-source";
        url = "https://github.com/google/benchmark";
        rev = "62937f91b5c763a8e119d0c20c67b87bde8eff1c";
        hash = "sha256-oFp/TbBpEB993RAcIZUV8ZIqaXKTuvupqDrp76nbaug=";
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
    ecal-057eaff3ce9ce0c1428019675ffb7332c96ec0b5 = substituteSource {
      src = fetchgit {
        name = "ecal-057eaff3ce9ce0c1428019675ffb7332c96ec0b5-source";
        url = "https://github.com/ros2-gbp/ecal-release.git";
        rev = "057eaff3ce9ce0c1428019675ffb7332c96ec0b5";
        hash = "sha256-ZOlO0rpToQHuRmI28wRBT5swBjy5JZgSsXLxM5bawlQ=";
      };
      substitutions = [
        {
          path = "thirdparty/ftxui/cmake/ftxui_find_google_benchmark.cmake";
          from = "GIT_REPOSITORY \"https://github.com/google/benchmark\"";
          to = "URL ${benchmark-vendor_source-62937f91b5c763a8e119d0c20c67b87bde8eff1c}";
        }
        {
          path = "thirdparty/spdlog/bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${benchmark-vendor_source-f91b6b42b1b9854772a90ae9501464a161707d1e}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/asio/asio_make_available.cmake";
          from = "GIT_REPOSITORY https://github.com/chriskohlhoff/asio.git";
          to = "URL ${asio-vendor_source-147f7225a96d45a2807a64e443177f621844e51c}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/npcap/npcap_make_available.cmake";
          from = "URL      \"\${NPCAP_SDK_ARCHIVE_URL}\"";
          to = "URL ${npcap_sdk_1-vendor_source-0a17n2nkcz76v81wb8lfp1w3q9dfvnzhm02prsq6l18ymhja24r5}";
        }
        {
          path = "thirdparty/udpcap/thirdparty/pcapplusplus/pcapplusplus_make_available.cmake";
          from = "URL      \"\${PCAPPLUSPLUS_ARCHIVE_URL}\"";
          to = "URL ${pcapplusplus_22-vendor_source-18sw56p59zqp1nczi9kf1wma90hgyra0qr6ffi9qjhd92rp8ly7h}";
        }
      ];
    };
    npcap_sdk_1-vendor_source-0a17n2nkcz76v81wb8lfp1w3q9dfvnzhm02prsq6l18ymhja24r5 = substituteSource {
      src = fetchzip {
        name = "npcap_sdk_1-vendor_source-0a17n2nkcz76v81wb8lfp1w3q9dfvnzhm02prsq6l18ymhja24r5-source";
        url = "https://npcap.com/dist/npcap-sdk-1.13.zip";
        hash = "sha256-JROhJKweBWqwzleACr/driU8eLiOosUD2uZ8Nq2wJyg=";
      };
      substitutions = [
      ];
    };
    pcapplusplus_22-vendor_source-18sw56p59zqp1nczi9kf1wma90hgyra0qr6ffi9qjhd92rp8ly7h = substituteSource {
      src = fetchzip {
        name = "pcapplusplus_22-vendor_source-18sw56p59zqp1nczi9kf1wma90hgyra0qr6ffi9qjhd92rp8ly7h-source";
        url = "https://github.com/seladb/PcapPlusPlus/releases/download/v22.05/pcapplusplus-22.05-windows-vs2015.zip";
        hash = "sha256-8HiKbhapQYlTdM5kDFT2D4KkKg9upviZDRf/VK4pXKM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecal";
  version = "5.12.0-4";
  src = sources.ecal-057eaff3ce9ce0c1428019675ffb7332c96ec0b5;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "protobuf-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "eCAL - enhanced Communication Abstraction Layer. A fast publish-subscribe cross-plattform middleware using Shared Memory and UDP.";
  };
}
