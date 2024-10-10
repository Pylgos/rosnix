{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "hash_library_vendor" = substituteSource {
      src = fetchgit {
        name = "hash_library_vendor-source";
        url = "https://github.com/ros2-gbp/hash_library_vendor-release.git";
        rev = "3281376fc244edcfe6ce5f9d845e0ab30923d3ba";
        hash = "sha256-/aXRAfmumq2WRfhcS24fzeg13YY+hDi9NQYpVUQNR6w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/stbrumme/hash-library.git";
          to = "URL ${sources."hash_library_vendor/hash-library"}";
        }
      ];
    };
    "hash_library_vendor/hash-library" = substituteSource {
      src = fetchgit {
        name = "hash-library-source";
        url = "https://github.com/stbrumme/hash-library.git";
        rev = "70cc93763d49a24c4536c7f0a23248f9b40e30f5";
        hash = "sha256-z4JzmggZnNfsTD8OzBiX4egJax4qJXGYr2Q8GPrInRI=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "hash_library_vendor";
  version = "0.1.1-6";
  src = finalAttrs.passthru.sources."hash_library_vendor";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS2 vendor package for stbrumme/hash-library";
  };
})
