{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    swri_dbw_interface-b6f466ad9de2050db032b9f389b7fe366fb61b1c = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-b6f466ad9de2050db032b9f389b7fe366fb61b1c-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "b6f466ad9de2050db032b9f389b7fe366fb61b1c";
        hash = "sha256-sui4AJRXbvUlIwXEiXmtJkOiTx3neUbgobZENVNKvuw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_dbw_interface";
  version = "3.7.3-1";
  src = sources.swri_dbw_interface-b6f466ad9de2050db032b9f389b7fe366fb61b1c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides documentation on common interface conventions for drive-by-wire systems.";
  };
}
