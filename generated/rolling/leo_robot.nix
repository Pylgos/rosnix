{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo_bringup,
  leo_fw,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    leo_robot = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "3f64d1fce3f3eab2a066b8cdb34964381cb8734a";
        hash = "sha256-0LFVi2DALRU231BQNWmUX5ZbnWkeGbjwQ7+D8HUZ5Rw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_robot";
  version = "1.4.0-2";
  src = sources.leo_robot;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ leo leo_bringup leo_fw ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage of software to install on Leo Rover.";
  };
}
