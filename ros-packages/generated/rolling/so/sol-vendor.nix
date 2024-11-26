{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ouxt-lint-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sol_vendor";
  version = "0.0.3-4";
  src = finalAttrs.passthru.sources."sol_vendor";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "sol_vendor" = substituteSource {
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
            to = "URL ${sources."sol_vendor/sol2"}";
          }
        ];
      };
      "sol_vendor/sol2" = substituteSource {
        src = fetchgit {
          name = "sol2-source";
          url = "https://github.com/ThePhD/sol2.git";
          rev = "dca62a0f02bb45f3de296de3ce00b1275eb34c25";
          hash = "sha256-7QHZRudxq3hdsfEAYKKJydc4rv6lyN6UIt/2Zmaejx8=";
        };
      };
    });
  };
  meta = {
    description = "vendor package for the sol2 library";
  };
})
