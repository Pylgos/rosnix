{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-package,
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
    "ament_cmake_gen_version_h" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "ba82568cdb01f07f899d1f481c6a608e0a813720";
        hash = "sha256-cby+O3cu+9aCImZSKIxl2trpTsvmme7WEA7yE/33lmQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_gen_version_h";
  version = "2.7.0-1";
  src = sources."ament_cmake_gen_version_h";
  nativeBuildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
}
