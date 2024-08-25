{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tango-icon-theme,
}:
let
  sources = rec {
    tango_icons_vendor = substituteSource {
      src = fetchgit {
        name = "tango_icons_vendor-source";
        url = "https://github.com/ros2-gbp/tango_icons_vendor-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tango-icon-theme ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "tango_icons_vendor provides the public domain Tango icons for non-linux systems (";
  };
}
