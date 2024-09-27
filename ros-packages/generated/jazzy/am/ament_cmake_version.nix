{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_version-32420daf26d8fad29ef3e22789b21693b90d0cfb = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-32420daf26d8fad29ef3e22789b21693b90d0cfb-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "32420daf26d8fad29ef3e22789b21693b90d0cfb";
        hash = "sha256-BVd7jyhX4TNgCF1a1mrSGI9AfEqbvfezA+3m6IrykIA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_version";
  version = "2.5.2-1";
  src = sources.ament_cmake_version-32420daf26d8fad29ef3e22789b21693b90d0cfb;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
}
