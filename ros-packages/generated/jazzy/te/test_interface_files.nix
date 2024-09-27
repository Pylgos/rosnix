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
    test_interface_files-be3978a0de425a0be5cb3530800a3d34f2fe0027 = substituteSource {
      src = fetchgit {
        name = "test_interface_files-be3978a0de425a0be5cb3530800a3d34f2fe0027-source";
        url = "https://github.com/ros2-gbp/test_interface_files-release.git";
        rev = "be3978a0de425a0be5cb3530800a3d34f2fe0027";
        hash = "sha256-55oYOWFsjeO86zmwokUyJ+y79la3zhFhSRObMo+Ihj4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_interface_files";
  version = "0.11.0-3";
  src = sources.test_interface_files-be3978a0de425a0be5cb3530800a3d34f2fe0027;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
}
