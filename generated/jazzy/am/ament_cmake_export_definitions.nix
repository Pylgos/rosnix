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
    ament_cmake_export_definitions-d05333c9e98e9d54210b9129da24398da08b5a93 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_definitions-d05333c9e98e9d54210b9129da24398da08b5a93-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d05333c9e98e9d54210b9129da24398da08b5a93";
        hash = "sha256-gjA5vE6MoQRHBoArre5vwo9dhBcSweurSOa5duKj4CM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_definitions";
  version = "2.5.2-1";
  src = sources.ament_cmake_export_definitions-d05333c9e98e9d54210b9129da24398da08b5a93;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to export definitions to downstream packages in the ament buildsystem.";
  };
}
