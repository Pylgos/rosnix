{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_lint-fd288a5221f6fe0c5a20e3392eac9bfc49578931 = substituteSource {
      src = fetchgit {
        name = "ament_lint-fd288a5221f6fe0c5a20e3392eac9bfc49578931-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "fd288a5221f6fe0c5a20e3392eac9bfc49578931";
        hash = "sha256-1FbkiZrxjuALIPXdxlYFWn8yilt8SSI8m/TDxm33r3U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint";
  version = "0.18.1-1";
  src = sources.ament_lint-fd288a5221f6fe0c5a20e3392eac9bfc49578931;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Providing common API for ament linter packages.";
  };
}
