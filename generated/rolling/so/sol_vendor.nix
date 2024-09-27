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
    sol_vendor-4ea37ff0118e62b1f8577475d5389ee754adc7ef = substituteSource {
      src = fetchgit {
        name = "sol_vendor-4ea37ff0118e62b1f8577475d5389ee754adc7ef-source";
        url = "https://github.com/ros2-gbp/sol_vendor-release.git";
        rev = "4ea37ff0118e62b1f8577475d5389ee754adc7ef";
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
  version = "0.0.3-4";
  src = sources.sol_vendor-4ea37ff0118e62b1f8577475d5389ee754adc7ef;
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
