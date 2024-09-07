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
        rev = "0b5d087a5f07a54820d0fbf75bc152deae3ad3d0";
        hash = "sha256-tC4nopX+Kqj5oNNdGMjHZbbTubgklz1FpXsQrloJiOM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_dbw_interface";
  version = "3.7.1-1";
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
