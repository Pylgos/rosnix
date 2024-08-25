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
    ament_clang_tidy = substituteSource {
      src = fetchgit {
        name = "ament_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "657a7ead01403d54af1ac7aae3f4fafceac09927";
        hash = "sha256-rWZZKEhMo2MePoR630azSKSYAafpV2ROQHjQD7//L1E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_clang_tidy";
  version = "0.17.1-1";
  src = sources.ament_clang_tidy;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ clang buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clang python3Packages.pyyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against style conventions using clang-tidy and generate xUnit test result files.";
  };
}
