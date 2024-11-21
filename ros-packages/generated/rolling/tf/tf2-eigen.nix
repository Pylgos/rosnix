{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "tf2_eigen" = substituteSource {
      src = fetchgit {
        name = "tf2_eigen-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "ef767e5dfc9661b6b47e370665da30bd82f46fbc";
        hash = "sha256-iSeq3I4eZ0OQSMX4gJUsIPuQLerZvSnjTjHi8JH1BEI=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_eigen";
  version = "0.39.2-1";
  src = finalAttrs.passthru.sources."tf2_eigen";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "tf2_eigen";
  };
})
