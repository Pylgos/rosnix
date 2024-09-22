{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_math_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sdformat_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "sdformat_vendor-source";
        owner = "ros2-gbp";
        repo = "sdformat_vendor-release";
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
      src = fetchFromGitHub {
        name = "sdformat_vendor-vendor_source-sdformat-0-source";
        owner = "gazebosim";
        repo = "sdformat";
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
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-dev" "pybind11-dev" "sdformat14" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libxml2-utils" "python3-psutil" "python3-pytest" ]; };
  meta = {
    description = "Vendor package for: sdformat14 14.5.0 SDFormat is an XML file format that describes environments, objects, and robots in a manner suitable for robotic applications";
  };
}
