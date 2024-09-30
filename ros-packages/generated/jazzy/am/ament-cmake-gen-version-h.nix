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
        rev = "a7e9cce7b0c6f8b0600d338112c98fe5cbf1da59";
        hash = "sha256-iM53Ds+Bz5kGrOaojMYc5LUlYCIwksTXl8n7BsYvaAE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_gen_version_h";
  version = "2.5.2-1";
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
