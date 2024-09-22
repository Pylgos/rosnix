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
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_math_vendor = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-source";
        url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
        rev = "9ee0d2c6b471b903146be7edba1daa76ac173e72";
        hash = "sha256-aeSRxO6Ulxx8Jun8wEcDM9GzDbK2GuJ+r57mJMJGTEk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_math_vendor-vendor_source-gz-math-0}";
        }
      ];
    };
    gz_math_vendor-vendor_source-gz-math-0 = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-vendor_source-gz-math-0-source";
        url = "https://github.com/gazebosim/gz-math.git";
        rev = "7a595ca81b2914c765e09075c656ae08078e9021";
        hash = "sha256-TEadejtPCR3FAUbyAAME28tmqaxypPTJDYidjZ3FPIY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_math_vendor";
  version = "0.0.6-1";
  src = sources.gz_math_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "gz-math7" "pybind11-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Vendor package for: gz-math7 7.5.0 Gazebo Math : Math classes and functions for robot applications";
  };
}
