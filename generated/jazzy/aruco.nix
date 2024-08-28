{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    aruco = substituteSource {
      src = fetchgit {
        name = "aruco-source";
        url = "https://github.com/pal-gbp/aruco_ros-release.git";
        rev = "1420fb9dbc4427826b9ba9b29c78d8a9905d0397";
        hash = "sha256-3Foblmp2VasqOKhDmgA7heDxnleqT6Pqnk7dXajdiE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco";
  version = "5.0.5-1";
  src = sources.aruco;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain). It provides real-time marker based 3D pose estimation using AR markers.";
  };
}
