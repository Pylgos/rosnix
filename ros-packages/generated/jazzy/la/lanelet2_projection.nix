{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_io,
  mrt_cmake_modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_projection-52590ef39bce10c356693a799124c8a09637168b = substituteSource {
      src = fetchgit {
        name = "lanelet2_projection-52590ef39bce10c356693a799124c8a09637168b-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "52590ef39bce10c356693a799124c8a09637168b";
        hash = "sha256-o4Gx/d7ijKvebHUq8BO78HeTfCKTIkE1raVOjESdhR4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_projection";
  version = "1.2.1-1";
  src = sources.lanelet2_projection-52590ef39bce10c356693a799124c8a09637168b;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt_cmake_modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2_io ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Lanelet2 projection library for lat/lon to local x/y conversion";
  };
}
