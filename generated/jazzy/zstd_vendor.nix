{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  zstd,
}:
let
  sources = rec {
    zstd_vendor = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "1f96118ede75e25677ac96b0578858c0fe9928c5";
        hash = "sha256-ZBGkZHVOL91El40Sdlx3iV+kSzn3SKzWHDLGGM9FnTQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/facebook/zstd.git";
          to = "VCS_TYPE path VCS_URL ${zstd_vendor-vendor_source-zstd-0}";
        }
      ];
    };
    zstd_vendor-vendor_source-zstd-0 = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-vendor_source-zstd-0-source";
        url = "https://github.com/facebook/zstd.git";
        rev = "63779c798237346c2b245c546c40b72a5a5913fe";
        hash = "sha256-tHHHIsQU7vJySrVhJuMKUSq11MzkmC+Pcsj00uFJdnQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_vendor";
  version = "0.26.4-1";
  src = sources.zstd_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Zstd compression vendor package, providing a dependency for Zstd.";
  };
}
