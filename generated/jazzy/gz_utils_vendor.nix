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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_utils_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_utils_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_utils_vendor-release";
        rev = "af727228ba30b99fb6e8186ea25a5e86ffcecbb8";
        hash = "sha256-XSES/VOnowqLB7zTSz3NcKXmrOKHsGkNwLQ93IsX9JI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_utils_vendor-vendor_source-gz-utils-0}";
        }
      ];
    };
    gz_utils_vendor-vendor_source-gz-utils-0 = substituteSource {
      src = fetchFromGitHub {
        name = "gz_utils_vendor-vendor_source-gz-utils-0-source";
        owner = "gazebosim";
        repo = "gz-utils";
        rev = "9e80552d723ee8f1ba0ed4fcb300d4d9551a138e";
        hash = "sha256-dNoDOZtk/zseHuOM5mOPHkXKU7wqxxKrFnh7e09bjRA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_utils_vendor";
  version = "0.0.4-1";
  src = sources.gz_utils_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-utils2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for: gz-utils2 2.2.0 Gazebo Utils : Classes and functions for robot applications";
  };
}
