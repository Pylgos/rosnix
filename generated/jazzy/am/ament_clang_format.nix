{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_clang_format-108127c8819c5e591ef89309ddea19d561a93915 = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-108127c8819c5e591ef89309ddea19d561a93915-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "108127c8819c5e591ef89309ddea19d561a93915";
        hash = "sha256-5I1qvVL1RNpJvCZa9P5A6+XVad0TvhYEHISldjxpZ2I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_clang_format";
  version = "0.17.1-1";
  src = sources.ament_clang_format-108127c8819c5e591ef89309ddea19d561a93915;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-format" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-format" "python3-yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against style conventions using clang-format and generate xUnit test result files.";
  };
}
