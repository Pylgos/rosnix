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
        rev = "e452bedb4beb3b68a82a6e5bfcf8b7a5e055319a";
        hash = "sha256-wBKGEI3Q+PeABsXxuEhrpxdXLVtv0gtT6r8/tDuR+qY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tango_icons_vendor";
  version = "0.4.0-1";
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
