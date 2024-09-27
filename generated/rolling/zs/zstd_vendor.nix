{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zstd-vendor_source-63779c798237346c2b245c546c40b72a5a5913fe = substituteSource {
      src = fetchgit {
        name = "zstd-vendor_source-63779c798237346c2b245c546c40b72a5a5913fe-source";
        url = "https://github.com/facebook/zstd.git";
        rev = "63779c798237346c2b245c546c40b72a5a5913fe";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
      substitutions = [
      ];
    };
    zstd_vendor-c845483874e363d8303f29168e02b14e08bd215c = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-c845483874e363d8303f29168e02b14e08bd215c-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c845483874e363d8303f29168e02b14e08bd215c";
        hash = "sha256-/wzAcJ0EHruM0g0IgUx0zjco135bBfUO2YVu/1U7AJA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/facebook/zstd.git";
          to = "VCS_TYPE path VCS_URL ${zstd-vendor_source-63779c798237346c2b245c546c40b72a5a5913fe}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_vendor";
  version = "0.29.0-1";
  src = sources.zstd_vendor-c845483874e363d8303f29168e02b14e08bd215c;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
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
