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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz-utils-vendor_source-9e80552d723ee8f1ba0ed4fcb300d4d9551a138e = substituteSource {
      src = fetchgit {
        name = "gz-utils-vendor_source-9e80552d723ee8f1ba0ed4fcb300d4d9551a138e-source";
        url = "https://github.com/gazebosim/gz-utils.git";
        rev = "9e80552d723ee8f1ba0ed4fcb300d4d9551a138e";
        hash = "sha256-dNoDOZtk/zseHuOM5mOPHkXKU7wqxxKrFnh7e09bjRA=";
      };
      substitutions = [
      ];
    };
    gz_utils_vendor-5483c2c3569adbeb4299c2954c2c1f5d691e4ba7 = substituteSource {
      src = fetchgit {
        name = "gz_utils_vendor-5483c2c3569adbeb4299c2954c2c1f5d691e4ba7-source";
        url = "https://github.com/ros2-gbp/gz_utils_vendor-release.git";
        rev = "5483c2c3569adbeb4299c2954c2c1f5d691e4ba7";
        hash = "sha256-DwH7H7E8iVQujUIZQnOU9gsKPMvXIX5UlVO24DQ7Q4M=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz-utils-vendor_source-9e80552d723ee8f1ba0ed4fcb300d4d9551a138e}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_utils_vendor";
  version = "0.1.0-1";
  src = sources.gz_utils_vendor-5483c2c3569adbeb4299c2954c2c1f5d691e4ba7;
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
