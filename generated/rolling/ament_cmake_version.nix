{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_version = substituteSource {
      src = fetchgit {
        name = "ament_cmake_version-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "743bedfbbaea3c340c7f181166f67d1f5a6c03b3";
        hash = "sha256-lnaMKznnLulU02VDsVW9v3ni7DfnFTfAnJHKjiPxzrU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_version";
  version = "2.7.0-1";
  src = sources.ament_cmake_version;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to override the exported package version in the ament buildsystem.";
  };
}
