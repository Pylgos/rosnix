{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_minimal_tb4_description" = substituteSource {
      src = fetchgit {
        name = "nav2_minimal_tb4_description-source";
        url = "https://github.com/ros-navigation/nav2_minimal_turtlebot_simulation-release.git";
        rev = "432d4a90df96c75d5c6c6578ea0f576fe3cad75d";
        hash = "sha256-r1KPRn5VOO/olYF6Mmv/bf6pcOMHjL89MxlPhLetbyI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_minimal_tb4_description";
  version = "1.0.1-1";
  src = sources."nav2_minimal_tb4_description";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint-state-publisher robot-state-publisher urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2's minimum Turtlebot4 Description package";
  };
}
