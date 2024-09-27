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
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_common-vendor_source-84df3704bfcffb85fa476c29e6181fba55c904dd = substituteSource {
      src = fetchgit {
        name = "gz_common-vendor_source-84df3704bfcffb85fa476c29e6181fba55c904dd-source";
        url = "https://github.com/gazebosim/gz-common.git";
        rev = "84df3704bfcffb85fa476c29e6181fba55c904dd";
        hash = "sha256-vM+/V2F+Nr/LReqcMAmAbgAyaph/vMZVb0BO0MAUp6I=";
      };
      substitutions = [
      ];
    };
    gz_common_vendor-606480b4a9cf124661f7bbac4cb4266a1d6ce469 = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-606480b4a9cf124661f7bbac4cb4266a1d6ce469-source";
        url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
        rev = "606480b4a9cf124661f7bbac4cb4266a1d6ce469";
        hash = "sha256-b0cdJW+5zN26CtaBvrWtXcrrE9ZbarEjoLEIWrud7VY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_common-vendor_source-84df3704bfcffb85fa476c29e6181fba55c904dd}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_common_vendor";
  version = "0.0.5-1";
  src = sources.gz_common_vendor-606480b4a9cf124661f7bbac4cb4266a1d6ce469;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg-dev" "gz-common5" "libfreeimage-dev" "libgdal-dev" "libgts" "tinyxml2" "uuid" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for: gz-common5 5.6.0 Gazebo Common : AV, Graphics, Events, and much more.";
  };
}
