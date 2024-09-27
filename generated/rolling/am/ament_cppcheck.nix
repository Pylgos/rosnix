{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cppcheck-9edd3b221e520812c71d1a6f7618c7935e1bade3 = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-9edd3b221e520812c71d1a6f7618c7935e1bade3-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9edd3b221e520812c71d1a6f7618c7935e1bade3";
        hash = "sha256-rzEn4wrykS30AoLSNj/AE0mFJLKHBMnWSg8p6G5N0Nk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cppcheck";
  version = "0.18.1-1";
  src = sources.ament_cppcheck-9edd3b221e520812c71d1a6f7618c7935e1bade3;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cppcheck" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to perform static code analysis on C/C++ code using Cppcheck and generate xUnit test result files.";
  };
}
