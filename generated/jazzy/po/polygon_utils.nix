{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
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
        rev = "32a840fb29275dcf540d8b14c28997d06756c144";
        hash = "sha256-Tt1eWbIDyhUfE+Cfkub8TW8XBNp+ilTdRYr4lfSa5A8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_utils";
  version = "1.1.0-1";
  src = sources.polygon_utils;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs polygon_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-shapely" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utilities for working with polygons, including triangulation";
  };
}
