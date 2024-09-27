{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "simple_term_menu_vendor" = substituteSource {
      src = fetchgit {
        name = "simple_term_menu_vendor-source";
        url = "https://github.com/clearpath-gbp/simple_term_menu_vendor-release.git";
        rev = "6ab8fbe31338a72360563ee2b2f44ba1512e745d";
        hash = "sha256-toTrUyUqy7ijNOnTyHXXDtn+mvXcO8izZRsbIFv9Szw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "simple_term_menu_vendor";
  version = "1.5.7-1";
  src = sources."simple_term_menu_vendor";
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A Python package which creates simple interactive menus on the command line.";
  };
}
