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
    mcap_vendor-2cc61ca16f9137b9facf9e0084978a456469be1a = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-2cc61ca16f9137b9facf9e0084978a456469be1a-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2cc61ca16f9137b9facf9e0084978a456469be1a";
        hash = "sha256-+YNlr32TW9G0LC8NqSuLPDuM7crL8dK3GvW3wA4jpPY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.4.0.tar.gz";
          to = "URL ${v1-vendor_source-15fprkr79j186jyphc2bgyspq4kqirk11r58924inl0f9j7lzdmv}";
        }
      ];
    };
    v1-vendor_source-15fprkr79j186jyphc2bgyspq4kqirk11r58924inl0f9j7lzdmv = substituteSource {
      src = fetchzip {
        name = "v1-vendor_source-15fprkr79j186jyphc2bgyspq4kqirk11r58924inl0f9j7lzdmv-source";
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
  src = sources.mcap_vendor-2cc61ca16f9137b9facf9e0084978a456469be1a;
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
