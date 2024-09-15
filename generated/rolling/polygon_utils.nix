{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  polygon_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    polygon_utils = substituteSource {
      src = fetchgit {
        name = "polygon_utils-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "a2066933b30766e1f83776fce4a253e9a83eef12";
        hash = "sha256-0deQK1zVECzgKwBQrLq3CbvDnZaRlnSpT1XOqhV1h58=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_utils";
  version = "1.0.2-2";
  src = sources.polygon_utils;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs polygon_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utilities for working with polygons, including triangulation";
  };
}
