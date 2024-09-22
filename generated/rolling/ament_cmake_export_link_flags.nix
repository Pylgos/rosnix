{
  ament_cmake_core,
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
    ament_cmake_export_link_flags = substituteSource {
      src = fetchFromGitHub {
        name = "ament_cmake_export_link_flags-source";
        owner = "ros2-gbp";
        repo = "ament_cmake-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to export link flags to downstream packages in the ament buildsystem.";
  };
}
