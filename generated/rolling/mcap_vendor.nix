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
        rev = "8d4681b3d9e5f1b591273e341bd050060d798703";
        hash = "sha256-UtCNI29w6TWzmykhYdKVd+iYTDhYr6OfCg2Zt/S9FKg=";
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
  version = "0.28.0-1";
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
