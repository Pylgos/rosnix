{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_auto" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "8f76a31f6bc50db1ff8a3622c11044b656ee1eec";
        hash = "sha256-42Cg+ZwQwpaxV7g8ZCFVitJr/X9cdrDiTDhCvH+sTEo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_auto";
  version = "2.7.0-1";
  src = sources."ament_cmake_auto";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
}
