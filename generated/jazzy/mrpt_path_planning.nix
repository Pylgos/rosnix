{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libnav,
  mrpt_libtclap,
  mvsim,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mrpt_path_planning = substituteSource {
      src = fetchgit {
        name = "mrpt_path_planning-source";
        url = "https://github.com/ros2-gbp/mrpt_path_planning-release.git";
        rev = "806a7f901a9ad1deb56f195af7a4086288ed02c0";
        hash = "sha256-9AxjfjBnPt6PuwE1Dw/WM2ehisMCIQjKOwkbJvyUkgI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_path_planning";
  version = "0.1.4-1";
  src = sources.mrpt_path_planning;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mrpt_libgui mrpt_libmaps mrpt_libnav mrpt_libtclap mvsim ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Path planning and navigation algorithms for robots/vehicles moving on planar environments. This library builds upon mrpt-nav and the theory behind PTGs to generate libraries of \"motion primitives\" for vehicles with arbitrary shape and realistic kinematics and dynamics.";
  };
}
