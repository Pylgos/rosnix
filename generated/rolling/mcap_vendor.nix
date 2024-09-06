{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  liblz4_vendor,
  substituteSource,
  zstd_vendor,
}:
let
  sources = rec {
    mcap_vendor = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2cc61ca16f9137b9facf9e0084978a456469be1a";
        hash = "sha256-+YNlr32TW9G0LC8NqSuLPDuM7crL8dK3GvW3wA4jpPY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.4.0.tar.gz";
          to = "URL ${mcap_vendor-vendor_source-v1-0}";
        }
      ];
    };
    mcap_vendor-vendor_source-v1-0 = substituteSource {
      src = fetchzip {
        name = "mcap_vendor-vendor_source-v1-0-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.4.0.tar.gz";
        hash = "sha256-u7ZPj0wOUBuJSKjkEGaOeBJ8tX9LMHi9NCjIdPLM15U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mcap_vendor";
  version = "0.29.0-1";
  src = sources.mcap_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ liblz4_vendor zstd_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "mcap vendor package";
  };
}
