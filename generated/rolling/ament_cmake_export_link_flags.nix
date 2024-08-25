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
    ament_cmake_export_link_flags = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_link_flags-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "5247bb9d79f5ea1daf2ae1f385c65109eb9323f3";
        hash = "sha256-Ix80doWrTds9Gt6AUX8ECBgNz+uCD9tOfSF8Me6CH2I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_link_flags";
  version = "2.7.0-1";
  src = sources.ament_cmake_export_link_flags;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
}
