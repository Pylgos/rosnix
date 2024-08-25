{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geodesy,
  geographic_msgs,
  substituteSource,
}:
let
  sources = rec {
    geographic_info = substituteSource {
      src = fetchgit {
        name = "geographic_info-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "d383a93b5b352857206ef02b4826a1ef3b2a3e96";
        hash = "sha256-9v0PhFwY4GRy9FH7XCYu+48GcNisf9Hg2093eaFWEKU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geographic_info";
  version = "1.0.6-1";
  src = sources.geographic_info;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geodesy geographic_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Geographic information metapackage. Not needed for wet packages, use only to resolve dry stack dependencies.";
  };
}
