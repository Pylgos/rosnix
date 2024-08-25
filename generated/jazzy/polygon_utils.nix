{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  polygon_msgs,
  substituteSource,
}:
let
  sources = rec {
    polygon_utils = substituteSource {
      src = fetchgit {
        name = "polygon_utils-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "622f2fd1fd527b46fb8e8294fa028901f57a32dd";
        hash = "sha256-0deQK1zVECzgKwBQrLq3CbvDnZaRlnSpT1XOqhV1h58=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_utils";
  version = "1.0.2-3";
  src = sources.polygon_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs polygon_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Utilities for working with polygons, including triangulation";
  };
}
