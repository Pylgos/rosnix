{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gmock = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gmock-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "dcd47081d7ad3bdf2aec1c295a33529487ad49e2";
        hash = "sha256-p/ujgJpEj8qGsnCzolischryGUnC4CVUFElTuHwJsLc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gmock";
  version = "2.5.2-1";
  src = sources.ament_cmake_gmock;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "google-mock" ]; };
  buildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_gtest ament_cmake_test gmock_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
}
