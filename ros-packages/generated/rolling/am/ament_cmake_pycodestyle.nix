{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pycodestyle-529492f0986383e2acb95a9207910f73e54f4e99 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pycodestyle-529492f0986383e2acb95a9207910f73e54f4e99-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "529492f0986383e2acb95a9207910f73e54f4e99";
        hash = "sha256-mTygsl8AdcvnnOSof5uI0q7mdJt+Pjt9xW7FfBgQ7RU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pycodestyle";
  version = "0.18.1-1";
  src = sources.ament_cmake_pycodestyle-529492f0986383e2acb95a9207910f73e54f4e99;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pycodestyle ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_pycodestyle to check code against the style conventions in PEP 8.";
  };
}
