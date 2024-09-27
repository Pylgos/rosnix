{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ouxt_lint_common,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    sol2-vendor_source-dca62a0f02bb45f3de296de3ce00b1275eb34c25 = substituteSource {
      src = fetchgit {
        name = "sol2-vendor_source-dca62a0f02bb45f3de296de3ce00b1275eb34c25-source";
        url = "https://github.com/ThePhD/sol2.git";
        rev = "dca62a0f02bb45f3de296de3ce00b1275eb34c25";
        hash = "sha256-7QHZRudxq3hdsfEAYKKJydc4rv6lyN6UIt/2Zmaejx8=";
      };
      substitutions = [
      ];
    };
    sol_vendor-7032049f388b7782d9c969c8b11371e07c40d61e = substituteSource {
      src = fetchgit {
        name = "sol_vendor-7032049f388b7782d9c969c8b11371e07c40d61e-source";
        url = "https://github.com/ros2-gbp/sol_vendor-release.git";
        rev = "7032049f388b7782d9c969c8b11371e07c40d61e";
        hash = "sha256-KyC2VV3zPu3hKaonkepXXm9mAKqTakBjLDSdKBEh4Os=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ThePhD/sol2.git";
          to = "URL ${sol2-vendor_source-dca62a0f02bb45f3de296de3ce00b1275eb34c25}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "sol_vendor";
  version = "0.0.3-5";
  src = sources.sol_vendor-7032049f388b7782d9c969c8b11371e07c40d61e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ouxt_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "vendor package for the sol2 library";
  };
}
