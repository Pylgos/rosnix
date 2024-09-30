{
  ament-cmake,
  ament-cmake-vendor-package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "zstd_vendor" = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "0bfa3f9aeb25214e8850a2dc064a051fb8c9968d";
        hash = "sha256-nH4f7XukIPem3PRW9e9f+HbARZafNefB5pBxxh7esOc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/facebook/zstd.git";
          to = "VCS_TYPE path VCS_URL ${sources."zstd_vendor/zstd"}";
        }
      ];
    };
    "zstd_vendor/zstd" = substituteSource {
      src = fetchgit {
        name = "zstd-source";
        url = "https://github.com/facebook/zstd.git";
        rev = "63779c798237346c2b245c546c40b72a5a5913fe";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "zstd_vendor";
  version = "0.26.5-1";
  src = sources."zstd_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Zstd compression vendor package, providing a dependency for Zstd.";
  };
}
