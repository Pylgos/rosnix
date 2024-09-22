{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
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
    tango_icons_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "tango_icons_vendor-source";
        owner = "ros2-gbp";
        repo = "tango_icons_vendor-release";
        rev = "f39545a4d833fdda28ad1458496129de949c59d8";
        hash = "sha256-AojB2C4N8d91dNC3ZqCjPlxc7h6RQQwp4qO/FzDaujM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tango_icons_vendor";
  version = "0.3.0-3";
  src = sources.tango_icons_vendor;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tango-icon-theme" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "tango_icons_vendor provides the public domain Tango icons for non-linux systems (";
  };
}
