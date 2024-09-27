{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gtest-a6aa1866e49295a076be8039dd5028ebae9f09c1 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-a6aa1866e49295a076be8039dd5028ebae9f09c1-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a6aa1866e49295a076be8039dd5028ebae9f09c1";
        hash = "sha256-MO0qCT0TGNOoKjbz21Mdd9l2q/YRK0g7j6k2v9yL+ig=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gtest";
  version = "2.7.0-1";
  src = sources.ament_cmake_gtest-a6aa1866e49295a076be8039dd5028ebae9f09c1;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test gtest_vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gtest" ]; };
  buildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_test gtest_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add gtest-based tests in the ament buildsystem in CMake.";
  };
}
