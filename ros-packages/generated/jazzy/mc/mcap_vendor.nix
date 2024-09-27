{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  liblz4_vendor,
  rosSystemPackages,
  substituteSource,
  zstd_vendor,
}:
let
  sources = rec {
    mcap_vendor-6884e7ba7d29d8db98ad2bbf09a6875bf5141e19 = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-6884e7ba7d29d8db98ad2bbf09a6875bf5141e19-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6884e7ba7d29d8db98ad2bbf09a6875bf5141e19";
        hash = "sha256-LkMN4KUG+iWT20KOK82Ypdx4iNw8f5cJqB4caw+uTiM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.3.0.tar.gz";
          to = "URL ${v1-vendor_source-108py78mxhlbibdi76v1bb02crlkbp9xn5ix73ywbhmlsra1sqxw}";
        }
      ];
    };
    v1-vendor_source-108py78mxhlbibdi76v1bb02crlkbp9xn5ix73ywbhmlsra1sqxw = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-108py78mxhlbibdi76v1bb02crlkbp9xn5ix73ywbhmlsra1sqxw-source";
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
  src = sources.mcap_vendor-6884e7ba7d29d8db98ad2bbf09a6875bf5141e19;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ liblz4_vendor zstd_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "mcap vendor package";
  };
}
