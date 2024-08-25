{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    swri_dbw_interface = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "4c34a7399b0ed6f3585e2a3a8e1ec412a40e4584";
        hash = "sha256-R/3o8fpxmCNv/RZhQcYoxeioiuK0u0WprDMKuyYGpyc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_dbw_interface";
  version = "3.6.1-3";
  src = sources.swri_dbw_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides documentation on common interface conventions for drive-by-wire systems.";
  };
}
