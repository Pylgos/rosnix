{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "leo_description" = substituteSource {
      src = fetchgit {
        name = "leo_description-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "fb10fa4cfb080e6967126b19ac1abc4c85aa85f0";
        hash = "sha256-Yi8hUp1UDui0Zdzwx6JhxHXBD4N3/L36/mN0dwOHufY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "leo_description";
  version = "3.0.3-1";
  src = sources."leo_description";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ robot-state-publisher xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "URDF Description package for Leo Rover";
  };
}
