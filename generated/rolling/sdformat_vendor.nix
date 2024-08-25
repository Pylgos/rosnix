{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_math_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  libxml2,
  python3Packages,
  substituteSource,
  tinyxml-2,
  urdfdom,
}:
let
  sources = rec {
    sdformat_vendor = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-source";
        url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
        rev = "b852a619f2259abead66e9c40217e995880643e3";
        hash = "sha256-gsrDuZkLQPAHefkSsTocTNXWLJzeTg/oz/RPpKP2Cw4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sdformat_vendor-vendor_source-sdformat-0}";
        }
      ];
    };
    sdformat_vendor-vendor_source-sdformat-0 = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-vendor_source-sdformat-0-source";
        url = "https://github.com/gazebosim/sdformat.git";
        rev = "86db7db7e0c95ebd544ca03f57bbed7b37061ba8";
        hash = "sha256-nGBLnQP0TTKDVbYGyx23Fcs79UCJveajsll2LvyLJwQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_vendor";
  version = "0.1.3-1";
  src = sources.sdformat_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor gz_utils_vendor python3Packages.pybind11 tinyxml-2 urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint libxml2 python3Packages.psutil python3Packages.pytest ];
  missingDependencies = [ "sdformat14" ];
  meta = {
    description = "Vendor package for: sdformat14 14.5.0 SDFormat is an XML file format that describes environments, objects, and robots in a manner suitable for robotic applications";
  };
}
