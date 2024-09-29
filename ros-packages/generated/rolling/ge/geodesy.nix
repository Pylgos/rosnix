{
  ament_cmake,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  mkSourceSet,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "geodesy" = substituteSource {
      src = fetchgit {
        name = "geodesy-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "6e391bae8989fbb7fde2f2a9ff047b752323712f";
        hash = "sha256-+iSI/nF1U9zJNt1tRwph3J72AI6GDwamBRol2QrwTUY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "geodesy";
  version = "1.0.6-1";
  src = sources."geodesy";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles geographic_msgs geometry_msgs sensor_msgs unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg" "python3-pyproj" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Python and C++ interfaces for manipulating geodetic coordinates.";
  };
}