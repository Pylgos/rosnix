{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gen_version_h-ba82568cdb01f07f899d1f481c6a608e0a813720 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-ba82568cdb01f07f899d1f481c6a608e0a813720-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "ba82568cdb01f07f899d1f481c6a608e0a813720";
        hash = "sha256-cby+O3cu+9aCImZSKIxl2trpTsvmme7WEA7yE/33lmQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gen_version_h";
  version = "2.7.0-1";
  src = sources.ament_cmake_gen_version_h-ba82568cdb01f07f899d1f481c6a608e0a813720;
  nativeBuildInputs = [ ament_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_package ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
}
