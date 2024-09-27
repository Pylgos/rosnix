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
    ament_clang_tidy-657a7ead01403d54af1ac7aae3f4fafceac09927 = substituteSource {
      src = fetchgit {
        name = "ament_clang_tidy-657a7ead01403d54af1ac7aae3f4fafceac09927-source";
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
  src = sources.ament_clang_tidy-657a7ead01403d54af1ac7aae3f4fafceac09927;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "python3-yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code against style conventions using clang-tidy and generate xUnit test result files.";
  };
}
