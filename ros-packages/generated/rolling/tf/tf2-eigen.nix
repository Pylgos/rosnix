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
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_eigen";
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_eigen";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_eigen" = substituteSource {
        src = fetchgit {
          name = "tf2_eigen-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "27ae14206b94cac70c709efbace04405234673cc";
          hash = "sha256-Y5qSSAUcef9wQdITNHJ00QJU5p8gJLlkeKlcenf2NnM=";
        };
      };
    });
  };
  meta = {
    description = "tf2_eigen";
  };
})
