{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gmock-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_gmock" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gmock-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "56d7c42d30dc1cea2e9d76b058261434bd25e471";
        hash = "sha256-VF2IxTBFW4xIEUlqG1/jH6IdY7a9xtjueNzlC3NqZ7s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_gmock";
  version = "2.7.0-1";
  src = sources."ament_cmake_gmock";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "google-mock" ]; };
  buildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-gtest ament-cmake-test gmock-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add Google mock-based tests in the ament buildsystem in CMake.";
  };
}
