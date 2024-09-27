{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_auto-7181c7fb46a89e026993ea016ab54889b3cdcc75 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-7181c7fb46a89e026993ea016ab54889b3cdcc75-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "7181c7fb46a89e026993ea016ab54889b3cdcc75";
        hash = "sha256-J1If3cVNRWqrWW421Z2KTDE+gW7Pv1WE7XveHX1N9XE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_auto";
  version = "2.5.2-1";
  src = sources.ament_cmake_auto-7181c7fb46a89e026993ea016ab54889b3cdcc75;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
}
