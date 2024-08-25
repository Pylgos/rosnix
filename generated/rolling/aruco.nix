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
        rev = "9ef32a20402915da4a3febabef80d97c3a59a46f";
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
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain). It provides real-time marker based 3D pose estimation using AR markers.";
  };
}
