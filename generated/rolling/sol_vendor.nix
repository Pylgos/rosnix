{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  ouxt_lint_common,
  substituteSource,
}:
let
  sources = rec {
    sol_vendor = substituteSource {
      src = fetchgit {
        name = "sol_vendor-source";
        url = "https://github.com/ros2-gbp/sol_vendor-release.git";
        rev = "4ea37ff0118e62b1f8577475d5389ee754adc7ef";
        hash = "sha256-KyC2VV3zPu3hKaonkepXXm9mAKqTakBjLDSdKBEh4Os=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ThePhD/sol2.git";
          to = "URL ${sol_vendor-vendor_source-sol2-0}";
        }
      ];
    };
    sol_vendor-vendor_source-sol2-0 = substituteSource {
      src = fetchgit {
        name = "sol_vendor-vendor_source-sol2-0-source";
        url = "https://github.com/ThePhD/sol2.git";
        rev = "dca62a0f02bb45f3de296de3ce00b1275eb34c25";
        hash = "sha256-7QHZRudxq3hdsfEAYKKJydc4rv6lyN6UIt/2Zmaejx8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sol_vendor";
  version = "0.0.3-4";
  src = sources.sol_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ouxt_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "vendor package for the sol2 library";
  };
}
