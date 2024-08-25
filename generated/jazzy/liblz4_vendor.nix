{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    liblz4_vendor = substituteSource {
      src = fetchgit {
        name = "liblz4_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "24a4a9d4e509be6f2345787f490c3111e74c82e7";
        hash = "sha256-7qUW2AEwVXQRPc8y3Kz3ZmAPEtKj3pR8brDzXbZjVYc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/lz4/lz4.git";
          to = "VCS_TYPE path VCS_URL ${liblz4_vendor-vendor_source-lz4-0}";
        }
      ];
    };
    liblz4_vendor-vendor_source-lz4-0 = substituteSource {
      src = fetchgit {
        name = "liblz4_vendor-vendor_source-lz4-0-source";
        url = "https://github.com/lz4/lz4.git";
        rev = "5ff839680134437dbf4678f3d0c7b371d84f4964";
        hash = "sha256-YiMCD3vvrG+oxBUghSrCmP2LAfAGZrEaKz0YoaQJhpI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "liblz4_vendor";
  version = "0.26.4-1";
  src = sources.liblz4_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liblz4" "liblz4-dev" ];
  meta = {
    description = "LZ4 compression vendor package, providing a dependency for LZ4.";
  };
}
