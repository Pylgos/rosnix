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
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gz_math_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-source";
        url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
        rev = "4840f657d7752dff33b3d624cf54cb175e51dfe7";
        hash = "sha256-d2L/KD+Ds7WT/opm9QoDnaBWzSKzxOiVGcd0hP2r5sk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_math_vendor/gz-math"}";
        }
      ];
    };
    "gz_math_vendor/gz-math" = substituteSource {
      src = fetchgit {
        name = "gz-math-source";
        url = "https://github.com/gazebosim/gz-math.git";
        rev = "7a595ca81b2914c765e09075c656ae08078e9021";
        hash = "sha256-TEadejtPCR3FAUbyAAME28tmqaxypPTJDYidjZ3FPIY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz_math_vendor";
  version = "0.1.1-1";
  src = sources."gz_math_vendor";
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