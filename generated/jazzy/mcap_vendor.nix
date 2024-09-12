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
        rev = "6884e7ba7d29d8db98ad2bbf09a6875bf5141e19";
        hash = "sha256-LkMN4KUG+iWT20KOK82Ypdx4iNw8f5cJqB4caw+uTiM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.0.tar.gz";
          to = "URL ${mcap_vendor-vendor_source-v1-0}";
        }
      ];
    };
    mcap_vendor-vendor_source-v1-0 = substituteSource {
      src = fetchzip {
        name = "mcap_vendor-vendor_source-v1-0-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.0.tar.gz";
        hash = "sha256-vGMdVNa0wsX9OD0W29Ndk2YmwFphmxPbiovCXtHxF4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mcap_vendor";
  version = "0.26.5-1";
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
