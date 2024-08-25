{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gen_version_h = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "a7e9cce7b0c6f8b0600d338112c98fe5cbf1da59";
        hash = "sha256-iM53Ds+Bz5kGrOaojMYc5LUlYCIwksTXl8n7BsYvaAE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gen_version_h";
  version = "2.5.2-1";
  src = sources.ament_cmake_gen_version_h;
  nativeBuildInputs = [ ament_package ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_package ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Generate a C header containing the version number of the package";
  };
}
