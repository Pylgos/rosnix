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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_cmake_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_cmake_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_cmake_vendor-release";
        rev = "f54cb972d24a8a02d3437e14ea644b16904e80f3";
        hash = "sha256-DSf43Rz9mM2enCZvPS6f2IDT6ei919mGq4+NO6WeMsk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_cmake_vendor-vendor_source-gz-cmake-0}";
        }
      ];
    };
    gz_cmake_vendor-vendor_source-gz-cmake-0 = substituteSource {
      src = fetchFromGitHub {
        name = "gz_cmake_vendor-vendor_source-gz-cmake-0-source";
        owner = "gazebosim";
        repo = "gz-cmake";
        rev = "ddd38ff196640024d6e054ff59cf5fea1ef01d73";
        hash = "sha256-fnN3Fmp7F5W0JixJUEp2v/OnXzmRidS5ujmSYxIRWto=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_cmake_vendor";
  version = "0.1.1-1";
  src = sources.gz_cmake_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  meta = {
    description = "Vendor package for: gz-cmake3 3.5.3 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
}
