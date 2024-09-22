{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_test,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_vendor_package = substituteSource {
      src = fetchFromGitHub {
        name = "ament_cmake_vendor_package-source";
        owner = "ros2-gbp";
        repo = "ament_cmake-release";
        rev = "8a65d8812e213b00f90cfcf92c2d062b328f8b37";
        hash = "sha256-daoMQP7Ondq4QX+qm1GZURdroE1bTid2yWeQweFcEoI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_vendor_package";
  version = "2.7.0-1";
  src = sources.ament_cmake_vendor_package;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-vcstool" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-vcstool" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_test ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Macros for maintaining a 'vendor' package.";
  };
}
