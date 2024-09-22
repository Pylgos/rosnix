{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    liblz4_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "liblz4_vendor-source";
        owner = "ros2-gbp";
        repo = "rosbag2-release";
        rev = "721c177ac9d2b244763802f973c8d86c16cbdfbf";
        hash = "sha256-m8aKf+fzVlyFWAt/1w7v/gU/Ipw28SW19TdoTrPSZSQ=";
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
      src = fetchFromGitHub {
        name = "liblz4_vendor-vendor_source-lz4-0-source";
        owner = "lz4";
        repo = "lz4";
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
  version = "0.29.0-1";
  src = sources.liblz4_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblz4" "liblz4-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "LZ4 compression vendor package, providing a dependency for LZ4.";
  };
}
