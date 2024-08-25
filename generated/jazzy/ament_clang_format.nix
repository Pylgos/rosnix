{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  clang,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_clang_format = substituteSource {
      src = fetchgit {
        name = "ament_clang_format-source";
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
  src = sources.ament_clang_format;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ clang buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clang python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against style conventions using clang-format and generate xUnit test result files.";
  };
}
