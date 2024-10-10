{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  liblz4-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  zstd-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "mcap_vendor" = substituteSource {
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
          to = "URL ${sources."mcap_vendor/v1"}";
        }
      ];
    };
    "mcap_vendor/v1" = substituteSource {
      src = fetchzip {
        name = "v1-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v1.4.0.tar.gz";
        hash = "sha256-u7ZPj0wOUBuJSKjkEGaOeBJ8tX9LMHi9NCjIdPLM15U=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "mcap_vendor";
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."mcap_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ liblz4-vendor zstd-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "mcap vendor package";
  };
})
