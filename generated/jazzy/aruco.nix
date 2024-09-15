{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain). It provides real-time marker based 3D pose estimation using AR markers.";
  };
}
